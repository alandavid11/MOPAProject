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
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: UserInfo?
    private var tempUserSession: User?
    
    private let service = userService()
    
    init () {
        self.userSession = Auth.auth().currentUser
        self.fetchuser()
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
            self.tempUserSession = user
            
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        // sets user session to nil so we show login view
        userSession = nil
        
        // Signs user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchuser() {
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
