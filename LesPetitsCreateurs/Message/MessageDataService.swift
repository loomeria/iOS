//
//  UserData.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import Foundation

final class MessageDataService {
    
    static func fetchData() async throws -> [MessageModel] {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw MessageError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw MessageError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([MessageModel].self, from: data)
        } catch {
            throw MessageError.invalidData
        }
    }
}
