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
        
        print("DEBUG: User session is:\(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { Result, error in
            if let error = error {
                print("DEBUG Failed to login with error\(error.localizedDescription)")
                return
            }
            
            guard let user = Result?.user else {return}
            self.userSession = user
            print("DEBUG Did log user in")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { Result, error in
            if let error = error {
                print("DEBUG Failed to register with error\(error.localizedDescription)")
                return
            }
            
            guard let user = Result?.user else {return}
            self.userSession = user
            
            print("Register user succesfully")
            print("User is \(self.userSession?.uid)")
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG Did upload user data")
                }
        }
    }
    
    func signOut() {
        // sets user session to nil so we show login view
        userSession = nil
        
        // Signs user out on server
        try? Auth.auth().signOut()
    }
}
