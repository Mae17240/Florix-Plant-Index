//
//  PlantModel.swift
//  Florix
//
//  Created by Joshua Mae on 03/02/2026.
//

import Foundation

struct Plant: Identifiable, Codable {
    let id: Int
    let scientificName: String
    let commonName: String?
    let family: String?
    let genus: String?
    let description: String?
    let wateringFrequency: String?
    let lightRequirement: String?
    let temperatureRange: String?
    let humidity: String?
    
    // Initialize from GBIF API response
    init(from gbifData: GBIFSpecies) {
        self.id = gbifData.key
        self.scientificName = gbifData.scientificName
        self.commonName = gbifData.vernacularName
        self.family = gbifData.family
        self.genus = gbifData.genus
        // These will need to be fetched from additional sources or hardcoded
        self.description = nil
        self.wateringFrequency = "Daily" // Default values
        self.lightRequirement = "Moderate"
        self.temperatureRange = "25-30"
        self.humidity = "Low Humidity"
    }
}

// GBIF API Response Models
struct GBIFResponse: Codable {
    let results: [GBIFSpecies]
}

struct GBIFSpecies: Codable {
    let key: Int
    let scientificName: String
    let canonicalName: String?
    let vernacularName: String?
    let family: String?
    let genus: String?
    let kingdom: String?
    let phylum: String?
    let order: String?
    let taxonomicStatus: String?
}
