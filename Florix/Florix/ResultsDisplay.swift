//
//  Results Display.swift
//  Florix
//
//  Created by Joshua Mae on 25/01/2026.
//

import Foundation
import SwiftUI

struct ResultsDisplay: View {
    let plant: Plant
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 233/255, green: 224/255, blue: 207/255).opacity(1)
                .ignoresSafeArea()
            GeometryReader { geo in
                // Parameters -> tweak these to change layout without moving other elements
                let imageHeight: CGFloat = 320
                let creamHeight: CGFloat = 700
                let overlap: CGFloat = 100 // how much the cream card overlaps the image vertically
                
                ZStack {
                    // Top image positioned at the top (fixed)
                    ZStack(alignment: .topLeading) {
                        Image("MainHome")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width, height: imageHeight)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                        
                        // Custom back button
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .padding(.leading, 16)
                        .padding(.top, 50) // Position below status bar
                        
                        VStack(alignment: .leading, spacing: 0) {
                            if let genus = plant.genus {
                                Text("\(genus).")
                                    .font(.custom("Baskervville-Regular", size: 40))
                                    .foregroundColor(.white)
                                    .padding(.leading, 45)
                                    .padding(.top, 40)
                                    .padding(.bottom, -10)
                            }
                            
                            Text(plant.commonName ?? plant.scientificName)
                                .foregroundColor(.white)
                                .font(.custom("DMSansBold", size: 20))
                                .padding(.leading, 50)
                        }
                        .frame(width: geo.size.width, height: imageHeight, alignment: .topLeading)
                    }
                    .frame(width: geo.size.width, height: imageHeight)
                    .position(x: geo.size.width / 2, y: imageHeight / 2)
                    
                    // Cream card
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 233/255, green: 224/255, blue: 207/255))
                            .clipShape(TopCornersRounded(radius: 60))
                            .frame(width: geo.size.width, height: creamHeight)
                            .ignoresSafeArea(edges: .bottom)
                        
                        // Content inside cream card
                        VStack(spacing: 20) {
                            
                            
                            // Section 1 - Plant desc
                            VStack(alignment: .leading, spacing: 8) {
                                Text(plant.description ?? "Scientific Name: \(plant.scientificName)\n\nFamily: \(plant.family ?? "Unknown")\n\nThis plant information is provided by the GBIF database. For detailed care instructions and growing information, please consult botanical resources specific to this species.")
                                    
                                    .font(.custom("Baskervville-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(10)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0)))
                            .padding(.horizontal, 32)
                            
                            .clipped()
                            
                            // Section 2 - Plant care
                            VStack(alignment: .leading, spacing: 6) {
                                // 2x2 Grid of rectangles
                                VStack(spacing: 10) {
                                    HStack(spacing: 10) {
                                        // Top left rectangle
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white.opacity(0))
                                            .frame(height: 50)
                                            .overlay(
                                                HStack(spacing: 8) {
                                                    Image("Water")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.blue)
                                                    
                                                    Text(plant.wateringFrequency ?? "Moderate")
                                                        .font(.custom("Baskervville-Regular", size: 14))
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.horizontal, 5)
                                            )
                                        
                                        // Top right rectangle
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white.opacity(0))
                                            .frame(height: 50)
                                            .overlay(
                                                HStack(spacing: 8) {
                                                    Image("Sun")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.orange)
                                                    
                                                    Text(plant.lightRequirement ?? "Moderate")
                                                        .font(.custom("Baskervville-Regular", size: 14))
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.horizontal, 5)
                                            )
                                    }
                                    
                                    HStack(spacing: 10) {
                                        // Bottom left rectangle
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white.opacity(0))
                                            .frame(height: 50)
                                            .overlay(
                                                HStack(spacing: 8) {
                                                    Image("Temp")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.red)
                                                    
                                                    Text(plant.temperatureRange ?? "20-25°C")
                                                        .font(.custom("Baskervville-Regular", size: 15))
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.horizontal, 5)
                                            )
                                        
                                        // Bottom right rectangle
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white.opacity(0))
                                            .frame(height: 50)
                                            .overlay(
                                                HStack(spacing: 8) {
                                                    Image("Humid")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.cyan)
                                                    
                                                    Text(plant.humidity ?? "Moderate")
                                                        .font(.custom("Baskervville-Regular", size: 14))
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.horizontal, 5)
                                            )
                                    }
                                }
                                .padding(.horizontal, 8)
                                
                                Spacer()
                                
                                
                            }
                            .padding(10)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0)))
                            .padding(.horizontal, 32)
                            .clipped()
                            
                            // Section 3 - Extra plant info
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Taxonomy Information:\n\nScientific Name: \(plant.scientificName)\nFamily: \(plant.family ?? "Unknown")\nGenus: \(plant.genus ?? "Unknown")\n\nThis information is sourced from the Global Biodiversity Information Facility (GBIF), the world's largest biodiversity database.")
                                
                                    .font(.custom("Baskervville-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(10)
                            .frame(height: 250)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0)))
                            .padding(.horizontal, 32)
                            .clipped()
                            
                            Spacer()
                        }
                        .frame(width: geo.size.width, height: creamHeight)
                        .padding(.top, 12)
                        .offset(y: 30) // move inner content downward inside the cream card
                    }
                    
                    .position(x: geo.size.width / 2, y: imageHeight - overlap + (creamHeight / 2.2))
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true) // Hide the default navigation bar
    }
}

struct ResultsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDisplay(plant: Plant(from: GBIFSpecies(
            key: 1,
            scientificName: "Orchidaceae cattleya",
            canonicalName: "Cattleya",
            vernacularName: "Orchid",
            family: "Orchidaceae",
            genus: "Cattleya",
            kingdom: "Plantae",
            phylum: nil,
            order: "Asparagales",
            taxonomicStatus: "ACCEPTED"
        )))
    }
}
