//
//  MOPAProjectApp.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI
import Firebase

@main
struct MOPAProjectApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    
          }.environmentObject(viewModel)
        }
    }
}
