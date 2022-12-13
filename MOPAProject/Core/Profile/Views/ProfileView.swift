//
//  ProfileView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 01/12/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: PostFilterViewModel = .Bets
    @Environment(\.dismiss) private var dismiss
    @Namespace var animation
    private let user: UserInfo
    
    init(user: UserInfo){
        self.user = user
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
            
            postFilterBar
            
            postView
            
            Spacer()
        }.toolbar(.hidden)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: UserInfo(id: NSUUID().uuidString,
                                   username: "spiderman",
                                   fullname: "Peter Parker",
                                   profileImageUrl: "",
                                   email: "spiderman@hotmail.com"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color("darkgreen")
                .ignoresSafeArea()
            VStack {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                })
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 78, height: 78)
                .offset(x:16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button(action: {},
                   label: {Text("Edit Profile")
                .font(.subheadline)
                .bold()
                .frame(width: 120, height: 32)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))})
        }.padding(.trailing)
        
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4){
            
            HStack {
                Text(user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color("mediumgreen"))
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("El desarrollador de esta app")
                .font(.subheadline)
                .padding(.vertical)
            
            UserStatsView().padding(.vertical)
        }.padding(.horizontal)
    }
    
    var postFilterBar: some View {
        HStack{
            ForEach(PostFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color("darkgreen"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule()
                        .foregroundColor(Color(.clear))
                        .frame(height: 3)
                    }
                    
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x: 0, y: 16))
    }
    
    var postView: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...9, id: \.self){_ in
//                    PostRowView()
//                        .padding()
                }
            }
        }

    }
}
