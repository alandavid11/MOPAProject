//
//  PostService.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//
import FirebaseFirestoreSwift
import Firebase

struct PostService {
    
    func uploadPost(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("posts").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    func fetchPost(completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let post = documents.compactMap({try? $0.data(as: Post.self)})
                completion(post)
            }
    }
}
