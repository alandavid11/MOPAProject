//
//  PostService.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

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
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let post = documents.compactMap({try? $0.data(as: Post.self)})
                completion(post)
            }
    }
    
    func fetchPosts(forUid uid: String, completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let post = documents.compactMap({try? $0.data(as: Post.self)})
                completion(post.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }

    }
    

    
    
    
}

// MARK: Likes
extension PostService {
    func likePost(_ post: Post, completion: @escaping() -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let postId = post.id else {return}
        
        let userLikeRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore.firestore().collection("posts").document(postId)
            .updateData(["likes": post.likes + 1]) { _ in
                userLikeRef.document(postId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikePost(_ post: Post, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let postId = post.id else {return}
        guard post.likes > 0 else {return}
        
        let userLikeRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore.firestore().collection("posts")
            .document(postId)
            .updateData(["likes": post.likes - 1]) { _ in
                userLikeRef.document(postId).delete { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikedPost(_ post: Post, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let postId = post.id else {return}
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(postId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedPost(forUid uid: String, completion: @escaping([Post]) -> Void) {
        var posts = [Post]()
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { doc in
                    let postID = doc.documentID
                    
                    Firestore.firestore().collection("posts")
                        .document(postID)
                        .getDocument { snapshot, _ in
                            guard let post = try? snapshot?.data(as: Post.self) else {return}
                            posts.append(post)
                            
                            completion(posts)
                        }
                }
            }
    }
}
