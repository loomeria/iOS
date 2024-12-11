//
//  UserListViewModel.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//


import Foundation
import SwiftData
import SwiftUI

@MainActor
final class MessageListViewModel: ObservableObject {
    
    var modelContext: ModelContext?
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }
    
    @Published var userError: MessageError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getMessages() async {
        isLoading = true
        do {
            self.isLoading = false
            let messages = try await MessageDataService.fetchData()
            messages.forEach { modelContext?.insert($0) }
        } catch(let error) {
            userError = MessageError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
