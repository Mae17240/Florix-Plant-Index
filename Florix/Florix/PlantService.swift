//
//  PlantService.swift
//  Florix
//
//  Created by Joshua Mae on 03/02/2026.
//

import Foundation

class PlantService {
    static let shared = PlantService()
    
    private let baseURL = "https://api.gbif.org/v1/species"
    
    func searchPlants(query: String, isIndoor: Bool) async throws -> [Plant] {
        // Build the search URL
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let urlString = "\(baseURL)/search?q=\(searchQuery)&rank=SPECIES&status=ACCEPTED&limit=20"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GBIFResponse.self, from: data)
        
        // Convert GBIF species to Plant models
        return response.results.map { Plant(from: $0) }
    }
    
    func getPlantDetails(speciesKey: Int) async throws -> GBIFSpecies {
        let urlString = "\(baseURL)/\(speciesKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(GBIFSpecies.self, from: data)
    }
}
