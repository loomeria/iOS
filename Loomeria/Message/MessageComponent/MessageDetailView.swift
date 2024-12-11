//
//  MessageDetail.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 06/11/2024.
//

import SwiftUI

struct MessageDetail: View {
    var message: MessageModel

    var body: some View {
        VStack {
            Text("Message Detail")
                .font(.largeTitle)
            Text("Login: \(message.login ?? "")")
            Text("URL: \(message.url ?? "")")
            // Add more details as needed
        }
        .padding()
    }
}
