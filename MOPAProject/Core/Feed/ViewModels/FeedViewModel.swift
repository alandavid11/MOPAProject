//
//  FeedViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    let service = PostService()
    let usrService = userService()
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
        service.fetchPost { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.usrService.fetchUser(withUid: uid) { user in
                    self.posts[i].user = user
                }
            }
            
        }
    }
}

