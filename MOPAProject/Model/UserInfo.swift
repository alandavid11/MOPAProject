//
//  User.swift
//  MOPAProject
//
//  Created by Alan Gloria on 11/12/22.
//
import FirebaseFirestoreSwift
import Foundation
import FirebaseFirestore
 
struct UserInfo: Identifiable, Decodable {
    @DocumentID var id: String?
    var username: String
    var fullname: String
    var profileImageUrl: String
    var email: String
    
}
