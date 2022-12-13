//
//  uploadPostViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    @Published var didUploadPost = false
    
    let service = PostService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                self.didUploadPost = true
            } else {
                // show error message to user
            }
        }
    }
}
