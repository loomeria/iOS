//
//  MessageView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 29/10/2024.
//

import SwiftUI
import SwiftData

struct MessageView: View {
    var body: some View {
        
        MessageListView()
    }
}

#Preview {
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MessageModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    MessageView()
        .environmentObject(MessageListViewModel(modelContext: sharedModelContainer.mainContext))
}
