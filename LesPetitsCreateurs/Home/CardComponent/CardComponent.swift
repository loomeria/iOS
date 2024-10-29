//
//  CardComponent.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 28/10/2024.
//

import SwiftUI

struct CardComponent: View {
    var index: Int
    @Binding var selectedIndex: Int?
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "photo.artframe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0, height: 100.0)
                .matchedGeometryEffect(id: "picture\(index)", in: namespace)
                .padding()
            Text("Title \(index)")
                .matchedGeometryEffect(id: "title\(index)", in: namespace)
            Text("Subtitle \(index)")
                .padding(.bottom, 10.0)
                .matchedGeometryEffect(id: "subtitle\(index)", in: namespace)
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color.customGray.matchedGeometryEffect(id: "color\(index)", in: namespace))
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                selectedIndex = (selectedIndex == index) ? nil : index
            }
        }
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
        .cornerRadius(20)
    }
}

#Preview {
    CardComponent(index: 0, selectedIndex: .constant(nil), namespace: Namespace().wrappedValue)
}
