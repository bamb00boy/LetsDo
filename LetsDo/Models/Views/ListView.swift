//
//  ListView.swift
//  LetsDo
//
//  Created by Hruthviik Raj on 1/23/25.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Buy milk", isCompleted: false),
        ItemModel(title: "Learn SwiftUI", isCompleted: true),
        ItemModel(title: "Go for a walk", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle()) 
        .navigationTitle(Text("Let's Do List 📋"))
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}

