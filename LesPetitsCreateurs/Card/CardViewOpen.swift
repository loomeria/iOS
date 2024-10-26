//
//  CardViewOpen.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 26/10/2024.
//

import SwiftUI

struct CardViewOpen: View {
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            Text("Title")
                .matchedGeometryEffect(id: "title", in: namespace)
            Text("Subtitle")
                .matchedGeometryEffect(id: "subtitle", in: namespace)
        }
        .frame(width: 200.0, height: 200.0)
        .background(Color.gray.matchedGeometryEffect(id: "color", in: namespace))
    }
}

#Preview {
    CardViewOpen(namespace: Namespace().wrappedValue)
}
