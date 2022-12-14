//
//  User.swift
//  MOPAProject
//
//  Created by Alan Gloria on 11/12/22.
//
import FirebaseFirestoreSwift
import Foundation
import FirebaseFirestore
import Firebase
 
struct UserInfo: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id}
    
}
