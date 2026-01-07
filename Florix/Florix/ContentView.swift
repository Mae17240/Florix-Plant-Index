//
//  ContentView.swift
//  Florix
//
//  Created by Joshua Mae on 07/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    Image("MainHome")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                        .clipped()
                        .ignoresSafeArea(edges: .top)
                    
                    Spacer()
                }
                
                
                Rectangle() // White box
                    .fill(Color.white.opacity(1))
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                    .cornerRadius(60)
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 6)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                
                
                
                Rectangle() // bottom black box
                    .fill(Color.black.opacity(1))
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                    .cornerRadius(60)
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 6)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.06)
                
                
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
                    .font(.title2).bold()
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
