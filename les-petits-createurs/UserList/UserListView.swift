//
//  UserListView.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import SwiftData
import SwiftUI

struct UserListView: View {

    @EnvironmentObject var viewModel: UserListViewModel
    @Query(sort: \UserModel.login) var usersFromLocalDB: [UserModel]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                List(usersFromLocalDB, id: \.id) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.avatarURL ?? "")) {
                            image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                                .foregroundColor(.teal)
                        }
                        .frame(width: 50, height: 50)

                        VStack(alignment: .leading) {
                            Text(user.login?.capitalized ?? "")
                                .font(.headline)
                            Text(user.url ?? "")
                                .font(.subheadline)
                        }
                    }
                }
                .listStyle(.plain)
                .listRowInsets(EdgeInsets())
                .background(Color.white)
                .navigationTitle("Users")

                if viewModel.isLoading {
                    LoaderView()
                }
            }
        }
        .task {
            if usersFromLocalDB.isEmpty {
                await viewModel.getUsers()
            }
        }
        .alert(isPresented: $viewModel.shouldShowAlert) {
            return Alert(
                title: Text("Error"),
                message: Text(viewModel.userError?.errorDescription ?? "")
            )
        }
    }
}

#Preview {

    let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserModel.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(
                for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    UserListView().environmentObject(
        UserListViewModel(modelContext: ModelContext(sharedModelContainer)))
}
