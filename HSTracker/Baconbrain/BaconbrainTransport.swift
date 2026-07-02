//
//  BaconbrainTransport.swift
//  HSTracker
//
//  BACONBRAIN: loopback-only NDJSON push transport for the baconbrain sensor (BRS D6).
//  Binds 127.0.0.1:47800 and broadcasts one NDJSON line per snapshot to every connected client;
//  every newly-ready connection is immediately sent the latest known line (BRS §4.2).
//

import Foundation
import Network

final class BaconbrainTransport {
    private let queue = DispatchQueue(label: "baconbrain.transport")
    private var listener: NWListener?
    private var connections: [NWConnection] = []

    /// Set by the exporter; invoked on `queue` for every newly-ready connection.
    var latestLineProvider: (() -> Data?)?

    func start() {
        queue.async { [weak self] in
            self?.bind()
        }
    }

    /// Broadcasts `line` to every currently-ready connection. Safe to call from any queue.
    func broadcast(_ line: Data) {
        queue.async { [weak self] in
            guard let self else { return }
            for connection in self.connections {
                self.send(line, on: connection)
            }
        }
    }

    // MARK: - Binding (queue-confined)

    private func bind() {
        let params = NWParameters.tcp
        params.allowLocalEndpointReuse = true
        params.requiredLocalEndpoint = .hostPort(host: .ipv4(.loopback), port: 47800)

        let newListener: NWListener
        do {
            newListener = try NWListener(using: params)
        } catch {
            logger.error("BaconbrainTransport: failed to create listener: \(error)")
            retry()
            return
        }

        newListener.stateUpdateHandler = { [weak self] state in
            guard let self else { return }
            switch state {
            case .failed(let error):
                logger.error("BaconbrainTransport: listener failed (\(error)); retrying in 5s")
                newListener.cancel()
                self.retry()
            default:
                break
            }
        }

        newListener.newConnectionHandler = { [weak self] connection in
            self?.queue.async {
                self?.accept(connection)
            }
        }

        listener = newListener
        newListener.start(queue: queue)
    }

    private func retry() {
        queue.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.bind()
        }
    }

    private func accept(_ connection: NWConnection) {
        connections.append(connection)
        connection.stateUpdateHandler = { [weak self, weak connection] state in
            guard let self, let connection else { return }
            switch state {
            case .ready:
                self.queue.async {
                    if let line = self.latestLineProvider?() {
                        self.send(line, on: connection)
                    }
                }
            case .failed, .cancelled:
                self.queue.async {
                    self.connections.removeAll { $0 === connection }
                }
            default:
                break
            }
        }
        connection.start(queue: queue)
    }

    private func send(_ line: Data, on connection: NWConnection) {
        connection.send(content: line, completion: .contentProcessed { [weak self, weak connection] error in
            guard error != nil, let connection else { return }
            self?.queue.async {
                self?.connections.removeAll { $0 === connection }
            }
        })
    }
}
