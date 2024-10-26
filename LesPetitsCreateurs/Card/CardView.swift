//
//  CardView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 26/10/2024.
//

import SwiftUI

struct CardView: View {
    @Namespace private var namespace
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack {
            if isSelected {
                CardViewOpen(namespace: namespace)
            } else {
                CardViewClose(namespace: namespace)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isSelected.toggle()
            }
        }
    }
}

#Preview {
    CardView()
}
