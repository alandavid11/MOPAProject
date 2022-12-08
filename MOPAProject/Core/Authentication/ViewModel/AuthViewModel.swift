//
//  AuthViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 07/12/22.
//
import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    
    init () {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is:\(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG Login with email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        print("DEBUG register with email \(email)")
    }
}
