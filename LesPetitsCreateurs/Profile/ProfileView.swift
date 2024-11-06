//
//  ProfileView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 29/10/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var presentedProfiles: [ProfileModel] = []
    
    var body: some View {
        NavigationStack {
            VStack {
               
            }
            .navigationTitle("Profile")
        }
        .background(Color.white)
    }
}

#Preview {
    ProfileView()
}
