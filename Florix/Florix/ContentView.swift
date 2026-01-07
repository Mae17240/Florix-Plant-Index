//
//  ContentView.swift
//  Florix
//
//  Created by Joshua Mae on 07/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    @State private var imageOpacity: Double = 0
    @State private var textOpacity: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Image("MainHome")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height * 1)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                        
                        // Full-screen light opacity rectangle
                        Rectangle()
                            .fill(Color.black.opacity(0.4))
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .ignoresSafeArea(.all)
                        
                        VStack {
                            Text("Florix.")
                                .font(.custom("Baskervville-Regular", size: 45))
                                .foregroundColor(.white)
                                .padding(.top, 30)
                                .padding(.leading, -174)
                            
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 20) {
                            // Actual Search Bar
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18))
                                
                                TextField("Search for plants...", text: $searchText)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(.custom("Baskervville-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .focused($isSearchFocused)
                                
                                if !searchText.isEmpty {
                                    Button(action: {
                                        searchText = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16))
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.95))
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 30)
                            .padding(.leading, -10)
                            
                            // PlantCircleWhite image with text inline and text below
                            VStack(spacing: 8) {
                                HStack(spacing: 12) {
                                    Image("PlantCircleWhite")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .padding(.bottom, 50)
                                        .padding(.leading, 18)
                                        .opacity(isSearchFocused ? 0 : imageOpacity)
                                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                                    
                                    Text("Florix uses intelligent databases to identify plants in seconds. Discover detailed plant profiles, track your finds, and grow your botanical knowledge effortlessly. ")
                                        .font(.custom("Baskervville-Regular", size: 16))
                                        .foregroundColor(.white.opacity(1))
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 5)
                                        .opacity(isSearchFocused ? 0 : textOpacity)
                                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                                }
                            }
                            .padding(.top, 20)
                            .padding(.leading, -10)
                            
                            // Second PlantCircleWhite image with text (duplicate)
                            VStack(spacing: 8) {
                                HStack(spacing: 12) {
                                    Image("SunPlantLight")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .padding(.bottom, 50)
                                        .padding(.leading, 18)
                                        .opacity(isSearchFocused ? 0 : imageOpacity)
                                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                                    
                                    Text("Whether you’re curious, learning, or exploring outdoors, Florix makes plant knowledge effortlessly accessible")
                                        .font(.custom("Baskervville-Regular", size: 16))
                                        .foregroundColor(.white.opacity(1))
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 5)
                                        .opacity(isSearchFocused ? 0 : textOpacity)
                                        .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                                }
                            }
                            .padding(.top, 10)
                            .padding(.leading, 9)
                            
                            
                            
                        }
                        .padding(.top,-270)
                        .padding(.bottom, 20)
                    }
                    
                    Spacer()
                }
                
                // White and black rectangles with fade animation
                
                
                Rectangle() // bottom black box
                    .fill(Color.white.opacity(1))
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    .cornerRadius(60)
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 6)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.06)
                    .opacity(isSearchFocused ? 0 : 1)
                    .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear {
            
            withAnimation(.easeInOut(duration: 0.9)) {
                imageOpacity = 1
            }
            
            withAnimation(.easeInOut(duration: 0.8).delay(0.3)) {
                textOpacity = 1
            }
        }
    }
}
    
struct HomeSection: View {
    let title: String
    let systemImage: String
    let color: Color
    let height: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(LinearGradient(colors: [color.opacity(0.95), color.opacity(0.75)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: color.opacity(0.25), radius: 8, x: 0, y: 6)

            HStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                Text(title)
                    .font(.custom("Baskervville-SemiBold", size: 20))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .accessibilityElement(children: .combine)
    }
}

// Preview
#Preview {
    ContentView()
}
