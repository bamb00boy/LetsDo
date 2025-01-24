//
//  AddView.swift
//  LetsDo
//
//  Created by Hruthviik Raj on 1/23/25.
//

import SwiftUI

struct AddView: View {
    
    @State private var TextFieldtext: String = ""
    @State var someColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter your task", text: $TextFieldtext)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(someColor))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("SAVE".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item ✍️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
