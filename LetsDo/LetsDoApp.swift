//
//  LetsDoApp.swift
//  LetsDo
//
//  Created by Hruthviik Raj on 1/23/25.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages models for view
 
 */

@main
struct LetsDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack{
                    ListView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(listViewModel)
            } else {
                NavigationView{
                    ListView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(listViewModel)
            }
        }
    }
}
