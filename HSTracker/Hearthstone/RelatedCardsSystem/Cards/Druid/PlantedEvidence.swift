//
//  PlantedEvidence.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell. It costs (2) less this turn."
class PlantedEvidence: NatureStudies {
    override func getCardId() -> String { CardIds.Collectible.Druid.PlantedEvidence }
}

class PlantedEvidenceCore: PlantedEvidence {
    override func getCardId() -> String { CardIds.Collectible.Druid.PlantedEvidenceCorePlaceholder }
}
