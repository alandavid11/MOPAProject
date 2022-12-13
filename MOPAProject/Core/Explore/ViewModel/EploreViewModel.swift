//
//  EploreViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 12/12/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users =  [UserInfo]()
    @Published var searchText = ""
    var searchableUsers: [UserInfo] {
        if searchText.isEmpty{
            return users
        }else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    let service = userService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
