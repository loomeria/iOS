//
//  ContentView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 26/10/2024.
//

import SwiftUI


struct CardViewClose: View {
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
            Text("Title")
                .matchedGeometryEffect(id: "title", in: namespace)
            Text("Subtitle")
                .matchedGeometryEffect(id: "subtitle", in: namespace)
        }
        .frame(maxWidth: .infinity, alignment: .bottom)
        .background(Color.white.matchedGeometryEffect(id: "color", in: namespace))
    }
}

#Preview {
    CardViewClose(namespace: Namespace().wrappedValue)
}
