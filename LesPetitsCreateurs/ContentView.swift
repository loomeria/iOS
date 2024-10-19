//
//  ContentView.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 11/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var viewModel = ViewModel()

    var body: some View {
        NavigationSplitView {
            VStack {
                Text(viewModel.isCompleted ? "All items are completed" : "Not completed")
                    .frame(minWidth: 0, maxWidth: .infinity)
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        } label: {
                            Text("\(item.title) -> \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        viewModel.isCompleted = false
        withAnimation {
            let newItem = Item(title: "Items", timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
        print(items)
        if items.count == 1 {
            viewModel.isCompleted = true
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
