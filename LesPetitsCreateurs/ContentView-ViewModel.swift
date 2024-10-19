//
//  ContentView-ViewModel.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import Foundation

extension ContentView {
    
    @Observable
    class ViewModel: ObservableObject {
        var isCompleted = true
    }
}
