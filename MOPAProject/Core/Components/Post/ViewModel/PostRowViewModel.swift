//
//  PostRowViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 13/12/22.
//

import Foundation

class PostRowViewModel: ObservableObject {
    @Published var post: Post
    private let service = PostService()
    
    
    init(post: Post){
        self.post = post
        checkIfUserlikedPost()
    }
    
    func likePost() {
        service.likePost(post) {
            self.post.didLike = true
        }
    }
    
    func unlikePost() {
        service.unlikePost(post) {
            self.post.didLike = false
        }
    }
    
    func checkIfUserlikedPost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
}
