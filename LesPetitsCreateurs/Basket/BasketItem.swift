//
//  Item.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 11/10/2024.
//

import Foundation
import SwiftData

@Model
final class BasketItem {
    var title: String
    var isCompleted: Bool
    var timestamp: Date
    
    init(title: String, timestamp: Date, isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }
}
