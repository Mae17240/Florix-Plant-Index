//
//  ContentView.swift
//  Florix
//
//  Created by Joshua Mae on 07/01/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PlantSearchViewModel()
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    @State private var imageOpacity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var isIndoor: Bool = true
    @State private var showResults = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    // Background image spanning entire screen
                    Image("MainHome")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .ignoresSafeArea(.all)
                    
                    // Full-screen light opacity rectangle
                    Rectangle()
                        .fill(Color.black.opacity(0.2))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .ignoresSafeArea(.all)
                    
                    // GREEN RECTANGLE
                    ZStack {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color(red: 70/255, green: 77/255, blue: 32/255).opacity(1))
                            .frame(width: geometry.size.width, height: 900)
                            .clipShape(TopCornersRounded(radius: 60))
                            .position(x: geometry.size.width / 2, y: geometry.size.height - 90)
                            .ignoresSafeArea(.all)
                        
                        
                        VStack {
                            Spacer()
                            HStack {
                                Text("Search History.")
                                    .font(.custom("Baskervville-Regular", size: 24))
                                    .foregroundColor(.black)
                                    .padding(.leading, 40)
                                    .padding(.top, 120)
                                Spacer()
                                VStack(alignment: .trailing, spacing: 4) {
                                    Button(action: {
                                        // Button action here
                                    }) {
                                        HStack {
                                            Image(systemName: "arrow.right")
                                                .font(.system(size: 15, weight: .light))
                                                .foregroundColor(.black)
                                        }
                                        .frame(width: 45)
                                        .frame(height: 3)
                                        .padding(.vertical, 10)
                                        .background(RoundedRectangle(cornerRadius: 60).fill(Color(red: 233/255, green: 224/255, blue: 207/255)))
                                    }
                                    .padding(.top, 120)
                                }
                                .padding(.trailing, 24)
                            }
                            ZStack {
                                // Fixed-size background for history text
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white.opacity(0.08))
                                    .frame(width: geometry.size.width - 48, height: 120)
                                Text("The native range of this species is N. & W. Madagascar. It is a tree and grows primarily in the seasonally dry tropical biome. It is used as animal food, a poison, a medicine and invertebrate food, has environmental uses and for fuel and food.")
                                    .font(.custom("Baskervville-Regular", size: 15))
                                    .foregroundColor(.black)
                                    .frame(width: geometry.size.width - 64, height: 110, alignment: .topLeading)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .padding(.leading, 16)
                                    .padding(.top, 20)
                            }
                            .padding(.top, -10)
                            Spacer()
                        }
                        .frame(width: geometry.size.width, height: 900, alignment: .center)
                        .padding(.top, geometry.size.height - 990)
                    }
                    
                    // CREAM RECTANGLE
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color(red: 233/255, green: 224/255, blue: 207/255).opacity(1))
                        .frame(width: geometry.size.width, height:550)
                        .clipShape(TopCornersRounded(radius: 60))
                        .position(x: geometry.size.width / 2, y: geometry.size.height - 60)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text("Plant Of The Day.")
                                .font(.custom("Baskervville-Regular", size: 24))
                                .foregroundColor(.black)
                                .padding(.leading, 40)
                                .padding(.top, 250)
                            Spacer()
                        }
                        ZStack {
                            // Make the background rectangle taller
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white.opacity(0.07))
                                .frame(width: geometry.size.width - 48, height: 220)
                            Text("Like The Plant List, the WFO Plant List is a working list of all known plant species, but differs in that it is curated by the international taxonomic community. The Plant List has not been updated since 2013. The WFO Plant List aims to provide the highest quality information on which to base research, conservation, and the sustainable use of the world's biological resources. The WFO Plant List was launched in May 2021 as a next generation replacement for The Plant List, recognising the continuing need for a user-friendly, citable static list of all plant species. The WFO Plant List is a snapshot in time of the WFO Taxonomic Backbone – the dynamic global consensus classification used by WFO to organise and present floristic data. ")
                                .font(.custom("Baskervville-Regular", size: 15))
                                .foregroundColor(.black)
                                .frame(width: geometry.size.width - 64, height: 200, alignment: .topLeading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .padding(.leading, 16)
                                .padding(.top, -10)
                        }
                        .padding(.top, -10)
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: 550, alignment: .center)
                    .padding(.top, geometry.size.height - 610)
                    
                    VStack {
                        Text("Florix.")
                            .font(.custom("Baskervville-Regular", size: 45))
                            .foregroundColor(.white)
                            .padding(.top, 70)
                            .padding(.leading, -174)
                        
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        // Actual Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                            
                            TextField("Search for plants...", text: $searchText)
                                .textFieldStyle(PlainTextFieldStyle())
                                .font(.custom("Baskervville-Regular", size: 16))
                                .foregroundColor(.black)
                                .focused($isSearchFocused)
                                .onSubmit {
                                    performSearch()
                                }
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                    viewModel.searchResults = []
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16))
                                }
                            }
                            
                            // Toggle button for Indoor/Outdoor
                            Button(action: {
                                isIndoor.toggle()
                            }) {
                                Text(isIndoor ? "Indoor." : "Outdoor.")
                                    .font(.custom("Baskervville-SemiBold", size: 14))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 10)
                                    .background(isIndoor ? Color(red: 70/255, green: 77/255, blue: 32/255).opacity(0.5) : Color(red: 206/255, green: 190/255, blue: 164/255).opacity(0.5))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.80))
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.01), radius: 4, x: 0, y: 2)
                        .padding(.horizontal, 30)
                        .padding(.leading, -10)
                        
                        // Search Results List
                        if isSearchFocused && !viewModel.searchResults.isEmpty {
                            ScrollView {
                                VStack(spacing: 8) {
                                    ForEach(viewModel.searchResults) { plant in
                                        Button(action: {
                                            viewModel.selectPlant(plant)
                                            isSearchFocused = false
                                            showResults = true
                                        }) {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(plant.scientificName)
                                                        .font(.custom("Baskervville-Regular", size: 16))
                                                        .foregroundColor(.black)
                                                    if let commonName = plant.commonName {
                                                        Text(commonName)
                                                            .font(.custom("Baskervville-Regular", size: 14))
                                                            .foregroundColor(.gray)
                                                    }
                                                    if let family = plant.family {
                                                        Text(family)
                                                            .font(.custom("Baskervville-Regular", size: 12))
                                                            .foregroundColor(.gray)
                                                    }
                                                }
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.gray)
                                            }
                                            .padding()
                                            .background(Color.white.opacity(0.9))
                                            .cornerRadius(12)
                                        }
                                    }
                                }
                                .padding(.horizontal, 30)
                            }
                            .frame(maxHeight: 300)
                        }
                        
                        // Loading indicator
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.white)
                        }
                        
                        // Error message
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .font(.custom("Baskervville-Regular", size: 14))
                                .foregroundColor(.red)
                                .padding(.horizontal, 30)
                        }
                        
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
                                    .font(.custom("Baskerville-Regular", size: 16))
                                    .foregroundColor(.white.opacity(1))
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 5)
                                    .opacity(isSearchFocused ? 0 : textOpacity)
                                    .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.leading, -10)
                        
                        // Second PlantCircleWhite
                        VStack(spacing: 8) {
                            HStack(spacing: 12) {
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .padding(.bottom, 50)
                                    .padding(.leading, 18)
                                    .opacity(isSearchFocused ? 0 : imageOpacity)
                                    .animation(.easeInOut(duration: 0.3), value: isSearchFocused)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.leading, 9)
                    }
                    .padding(.top, -200)
                    .padding(.bottom, 100)
                }
            }
            .ignoresSafeArea(edges: .all)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.9)) {
                    imageOpacity = 1
                }
                
                withAnimation(.easeInOut(duration: 0.8).delay(0.3)) {
                    textOpacity = 1
                }
            }
            .onChange(of: searchText) { oldValue, newValue in
                Task {
                    await viewModel.searchPlants(query: newValue, isIndoor: isIndoor)
                }
            }
            .navigationDestination(isPresented: $showResults) {
                if let plant = viewModel.selectedPlant {
                    ResultsDisplay(plant: plant)
                }
            }
        }
    }
    
    private func performSearch() {
        Task {
            await viewModel.searchPlants(query: searchText, isIndoor: isIndoor)
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
                    .font(.custom("Baskerville-SemiBold", size: 20))
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

// Custom shape for rounding only top corners
struct TopCornersRounded: Shape {
    var radius: CGFloat = 30
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
        path.addQuadCurve(to: CGPoint(x: rect.minX + radius, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + radius), control: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
