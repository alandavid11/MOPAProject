//
//  UserService.swift
//  MOPAProject
//
//  Created by Alan Gloria on 11/12/22.
//
import FirebaseFirestoreSwift
import Foundation
import Firebase
import FirebaseFirestore

struct userService {
    
    func fetchUser(withUid uid: String, completion: @escaping(UserInfo) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                guard let user = try? snapshot.data(as: UserInfo.self) else { return }
               completion(user)
               
            }
    }
    
    func fetchUsers(completion: @escaping([UserInfo]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let users = documents.compactMap({ try? $0.data(as: UserInfo.self) })
                completion(users)
            }
    }
}
