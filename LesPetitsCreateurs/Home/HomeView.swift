//
//  HomeView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 28/10/2024.
//

import SwiftUI

struct HomeView: View {
    @Namespace private var namespace
    @State private var selectedCard: Int? = nil
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    ForEach(0..<10) { index in
                        CardComponent(index: index, selectedIndex: $selectedCard, namespace: namespace)
                            .opacity(selectedCard == nil || selectedCard == index ? 1.0 : 0.0)
                    }
                }
                .padding(.vertical, 20.0)
            }
            .blur(radius: selectedCard == nil ? 0 : 10)
            .frame(maxWidth: .infinity)
            

            if let selectedCard = selectedCard {
                CardDetailView(selectedIndex: $selectedCard, index: selectedCard, namespace: namespace)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
