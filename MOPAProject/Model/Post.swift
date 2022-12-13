//
//  Post.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: UserInfo?
}
