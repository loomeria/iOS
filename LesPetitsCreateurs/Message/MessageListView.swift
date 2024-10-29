//
//  MessageListView.swift
//  LesPetitsCreateurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import SwiftData
import SwiftUI

struct MessageListView: View {

    @EnvironmentObject var viewModel: MessageListViewModel
    @Query(sort: \MessageModel.login) var messagesFromLocalDB: [MessageModel]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                List(messagesFromLocalDB, id: \.id) { message in
                    HStack {
                        AsyncImage(url: URL(string: message.avatarURL ?? "")) {
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
                            Text(message.login?.capitalized ?? "")
                                .font(.headline)
                            Text(message.url ?? "")
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
            if messagesFromLocalDB.isEmpty {
                await viewModel.getMessages()
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
            MessageModel.self
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

    MessageListView().environmentObject(
        MessageListViewModel(modelContext: ModelContext(sharedModelContainer)))
}
