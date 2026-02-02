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
                                Text("Snake plants are one of the most popular houseplants, for good reason. It's incredibly drought-tolerant, with the ability to go weeks without water in low and medium lighting conditions. They tolerate low light (hence why they're so often seen in office buildings) but will thrive in bright light, sending up new leaves and stronger variegation.")
                                    
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
                                                    
                                                    Text("Daily")
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
                                                    
                                                    Text("Moderate")
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
                                                    
                                                    Text("25- 30")
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
                                                    
                                                    Text("Low Humidity")
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
                                Text("Snake plants are available in dozens of varieties and cultivars, with stiff-sword like leaves colored in bands of green, yellow, and cream. It's a hard-to-kill plant that makes it a go-to for any newer plant parent or anyone not interested in weekly watering duties. and cream. It's a hard-to-kill plant that makes it a go-to for any newer plant parent or anyone not interested in weekly watering duties.and cream. It's a hard-to-kill plant that makes it a go-to for any newer plant parent or anyone not interested in weekly watering duties.")
                                
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
    }
}

struct ResultsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDisplay()
    }
}
