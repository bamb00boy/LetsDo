//
//  AddView.swift
//  LetsDo
//
//  Created by Hruthviik Raj on 1/23/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldtext: String = ""
    @State var someColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter your task", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert )
    }
    
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldtext)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldtext.count < 3 {
            alertTitle = "Your task must be at least 3 characters long 😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
