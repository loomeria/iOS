//
//  les_petits_createursApp.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 11/10/2024.
//

import SwiftUI
import SwiftData

@main
struct LPCApp: App {
    let notificationManager = NotificationManager()

    
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            //Item.self,
            UserModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {

        WindowGroup {
            //ContentView()
            UserListView()
        }
        .environmentObject(UserListViewModel(modelContext: sharedModelContainer.mainContext))
        .modelContainer(sharedModelContainer)
    }
}
