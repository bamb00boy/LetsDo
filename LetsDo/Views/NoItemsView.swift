//
//  NoListView.swift
//  LetsDo
//
//  Created by Hruthviik Raj on 1/23/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No Items Found 🥲")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                Text("Add your item to get started!")
                    .padding(.bottom, 20)
                Spacer()
                NavigationLink(destination: AddView(),
                               label: {
                    Text("Add Item 😍")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                )
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: false)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
