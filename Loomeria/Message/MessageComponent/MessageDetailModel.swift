//
//  MessageModel.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 06/11/2024.
//

import Foundation

struct MessageDetailModel: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}
