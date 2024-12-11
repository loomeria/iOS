//
//  ProfileView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 29/10/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var presentedProfiles: [ProfileModel] = []
    @State private var showingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image("user-pict")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .clipShape(Circle())
                    
                
                Text("John Appleseed")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
            }
            .navigationTitle("Profile")

            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                VStack {
                    Text("Hello, World!")
                        .font(.headline)
                }
            }
        }
        .background(Color.white)
    }
}

#Preview {
    ProfileView()
}
