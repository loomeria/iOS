//
//  UserDataError.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import Foundation

enum MessageError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
            
        case .invalidResponse:
            return "Invalid Response"
            
        case .invalidData:
            return "Invalid data"
            
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
