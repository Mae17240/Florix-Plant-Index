//
//  PlantSearchViewModel.swift
//  Florix
//
//  Created by Joshua Mae on 03/02/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class PlantSearchViewModel: ObservableObject {
    @Published var searchResults: [Plant] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var selectedPlant: Plant?
    
    private let plantService = PlantService.shared
    
    func searchPlants(query: String, isIndoor: Bool) async {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            searchResults = try await plantService.searchPlants(query: query, isIndoor: isIndoor)
        } catch {
            errorMessage = "Failed to search plants: \(error.localizedDescription)"
            searchResults = []
        }
        
        isLoading = false
    }
    
    func selectPlant(_ plant: Plant) {
        selectedPlant = plant
    }
}
