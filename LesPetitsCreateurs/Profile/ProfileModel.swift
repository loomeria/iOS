//
//  ProfileModel.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 06/11/2024.
//

import Foundation

struct ProfileModel: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}
