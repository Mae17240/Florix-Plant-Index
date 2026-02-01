//
//  Results Display.swift
//  Florix
//
//  Created by Joshua Mae on 25/01/2026.
//

import Foundation
import SwiftUI

struct ResultsDisplay: View {
    var body: some View {
        ZStack {
            Color(red: 233/255, green: 224/255, blue: 207/255).opacity(1)
                .ignoresSafeArea()
            GeometryReader { geo in
                // Parameters -> tweak these to change layout without moving other elements
                let imageHeight: CGFloat = 280
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
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Orchid.")
                                .font(.custom("Baskervville-Regular", size: 40))
                                .foregroundColor(.white)
                                .padding(.leading, 45)
                                .padding(.top, 40)
                                .padding(.bottom, -10)
                            
                            Text("Cattlea")
                                .foregroundColor(.white)
                                .font(.custom("DMSansBold", size: 20))
                                .padding(.leading, 50)
                        }
                        .frame(width: geo.size.width, height: imageHeight, alignment: .topLeading)
                    }
                    .frame(width: geo.size.width, height: imageHeight)
                    .position(x: geo.size.width / 2, y: imageHeight / 2)
                    
                    // Cream card positioned absolutely so changing its height doesn't affect the image
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 233/255, green: 224/255, blue: 207/255))
                            .clipShape(TopCornersRounded(radius: 80))
                            .frame(width: geo.size.width, height: creamHeight)
                            .ignoresSafeArea(edges: .bottom)
                        
                        // Content inside cream card - frame matches creamHeight so internal elements stay fixed
                        VStack(spacing: 20) {
                            // Section 1 - Plant desc
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Plant description placeholder text goes here. This section will contain a summary or details about the plant.")
                                    .font(.custom("Baskervville-Regular", size: 18))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(16)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.5)))
                            .padding(.horizontal, 32)
                            .clipped()
                            
                            // Section 2 - Plant care
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Care")
                                    .font(.custom("Baskervville-Regular", size: 18))
                                    .foregroundColor(.black)
                                Text("Water weekly • Bright, indirect light")
                                    .font(.custom("DMSansBold", size: 14))
                                    .foregroundColor(.black.opacity(0.85))
                                Spacer()
                            }
                            .padding(16)
                            .frame(height: 150)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.5)))
                            .padding(.horizontal, 32)
                            .clipped()
                            
                            // Section 3 - Extra plant info
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Extra plant info placeholder text goes here. This section will contain additional information about the plant.")
                                    .font(.custom("Baskervville-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(16)
                            .frame(height: 150)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.5)))
                            .padding(.horizontal, 32)
                            .clipped()
                            
                            Spacer()
                        }
                        .frame(width: geo.size.width, height: creamHeight)
                        .padding(.top, 12)
                        .offset(y: 60) // move inner content downward inside the cream card
                    }
                    // center x; y is imageHeight - overlap + (creamHeight/2)
                    .position(x: geo.size.width / 2, y: imageHeight - overlap + (creamHeight / 2.2))
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

struct ResultsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDisplay()
    }
}

