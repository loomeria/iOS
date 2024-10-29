//
//  CardDetailView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 28/10/2024.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var selectedIndex: Int?
    var index: Int
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    selectedIndex = nil
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .padding()
            }
            Image(systemName: "photo.artframe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20.0)
                .frame(width: 200.0, height: 100.0)
                .matchedGeometryEffect(id: "picture\(index)", in: namespace)
            Spacer()
            Text("Title \(index)")
                .matchedGeometryEffect(id: "title\(index)", in: namespace)
            Text("Subtitle \(index)")
                .matchedGeometryEffect(id: "subtitle\(index)", in: namespace)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.matchedGeometryEffect(id: "color\(index)", in: namespace))
        .cornerRadius(20)
    }
}

#Preview {
    CardDetailView(selectedIndex: .constant(nil), index: 0, namespace: Namespace().wrappedValue)
}
