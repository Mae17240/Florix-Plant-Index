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
            VStack(spacing: 24) {
                // Top image
                ZStack(alignment: .topLeading) {
                    Image("MainHome")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)
                        .clipped()
                        .ignoresSafeArea(edges: .top)
                    VStack {
                        Text("Orchid.")
                            .font(.custom("Baskervville-Regular", size: 40))
                            .foregroundColor(.white)
                            .padding(.leading, 45)
                            .padding(.top, 40)
                            .padding(.bottom, -10)
                        
                        Text("Cattlea")
                            .foregroundColor(.white)
                            .font(.custom("DMSansBold", size: 20))
                            .padding(.leading, -15)
                            
                    }
                    .frame(maxWidth: .infinity, maxHeight: 280, alignment: .topLeading)
                }
                // Cream Rectangle
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 233/255, green: 224/255, blue: 207/255).opacity(1))
                    .clipShape(TopCornersRounded(radius: 80))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.top, -140) // overlap
                    .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

struct ResultsDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDisplay()
    }
}
