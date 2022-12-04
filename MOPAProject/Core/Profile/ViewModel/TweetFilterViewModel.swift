//
//  TweetFilterViewModel.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import Foundation

enum PostFilterViewModel: Int, CaseIterable {
    case Bets
    case Replies
    case likes
    
    var title: String{
        switch self {
            case .Bets: return "Bets"
            case .Replies: return "Replies"
            case .likes: return "Likes"
        }
    }
}
