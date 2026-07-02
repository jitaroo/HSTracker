//
//  NDJSONSink.swift
//  HSTracker
//
//  BACONBRAIN: debug NDJSON sink for the baconbrain sensor (BRS §4.2).
//  Appends one line per snapshot to ~/Library/Application Support/baconbrain/snapshots.ndjson,
//  truncating the file back to empty once it exceeds 50 MB (BRS: "rotate by truncation").
//

import Foundation

/// All calls are expected to arrive already-serialized on the exporter's serial queue, so this
/// type does no internal locking of its own.
final class NDJSONSink {
    private static let rotationLimit: UInt64 = 50 * 1024 * 1024

    private var fileHandle: FileHandle?
    private var disabled = false

    private lazy var fileURL: URL? = {
        guard let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return nil
        }
        return base.appendingPathComponent("baconbrain").appendingPathComponent("snapshots.ndjson")
    }()

    /// Writes `line` (already newline-terminated) to the sink file.
    func append(_ line: Data) {
        guard !disabled else { return }
        guard let handle = openHandleIfNeeded() else { return }

        do {
            try handle.seekToEnd()
            try handle.write(contentsOf: line)
            let offset = try handle.offset()
            if offset > Self.rotationLimit {
                try handle.truncate(atOffset: 0)
            }
        } catch {
            logger.error("BaconbrainKit NDJSONSink: write failed, disabling sink for this session: \(error)")
            disabled = true
        }
    }

    private func openHandleIfNeeded() -> FileHandle? {
        if let fileHandle {
            return fileHandle
        }
        guard let fileURL else {
            disabled = true
            return nil
        }
        do {
            let directory = fileURL.deletingLastPathComponent()
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                FileManager.default.createFile(atPath: fileURL.path, contents: nil)
            }
            let handle = try FileHandle(forWritingTo: fileURL)
            try handle.seekToEnd()
            fileHandle = handle
            return handle
        } catch {
            logger.error("BaconbrainKit NDJSONSink: failed to open \(fileURL.path): \(error)")
            disabled = true
            return nil
        }
    }
}
