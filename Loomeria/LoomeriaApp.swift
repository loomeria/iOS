//
//  LoomeriaApp.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 11/10/2024.
//

import SwiftUI
import SwiftData

@main
struct LoomeriaApp: App {
    init() {
        UITabBar.appearance().tintColor = UIColor.green
    }
    
    let notificationManager = NotificationManager()
    @State private var selectedTab: Tabs = .home
    
    enum Tabs: String, Equatable, Hashable, Identifiable {
        case home
        case basket
        case message
        case profile
        
        var id: String { rawValue }
    }
    
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
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                
                HomeView()
                    .tabItem {
                        Label("Accueil", systemImage: "house.fill")
                    }
                    .tag(Tabs.home)
                
                BasketView()
                    .tabItem {
                        Label("Basket", systemImage: "basket.fill")
                    }
                    .tag(Tabs.basket)
                
                
                MessageView()
                    .tabItem {
                        Label("Message", systemImage: "message.fill")
                    }
                    .tag(Tabs.message)
                    .environmentObject(MessageListViewModel(modelContext: sharedModelContainer.mainContext))
                    .modelContainer(sharedModelContainer)
                
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person.fill")
                    }
                    .tag(Tabs.profile)
            }
            .accentColor(.green)
        }
    }
}
