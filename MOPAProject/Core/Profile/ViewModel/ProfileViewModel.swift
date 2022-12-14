//
//  ProfileViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 13/12/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var post = [Post]()
    @Published var likedPost = [Post]()
    private let service = PostService()
    private let usrService = userService()
    let user: UserInfo
    
    init(user: UserInfo) {
        self.user = user
        self.fetchUserPost()
        self.fetchLikedPost()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func posts(forFilter filter: PostFilterViewModel) -> [Post] {
        switch filter {
            case .Bets:
                return post
                
            case .Replies:
                return post
                
            case .likes:
                return likedPost
        }
    }
    
    func fetchUserPost() {
        guard let uid = user.id else {return}
        service.fetchPosts(forUid: uid) { posts in
            self.post = posts
            
            for i in 0 ..< posts.count {
                self.post[i].user = self.user
            }
        }
    }
    
    func fetchLikedPost() {
        guard let uid = user.id else {return}
        
        service.fetchLikedPost(forUid: uid) { posts in
            self.likedPost = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.usrService.fetchUser(withUid: uid) { user in
                    self.likedPost[i].user = user
                }
            }
        }
    }
}
