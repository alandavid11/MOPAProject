//
//  UserRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: UserInfo
    
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 2){
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal).padding(.vertical, 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
