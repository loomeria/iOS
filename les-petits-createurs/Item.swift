//
//  Item.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 11/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
