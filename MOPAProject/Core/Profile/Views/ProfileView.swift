//
//  ProfileView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 01/12/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: PostFilterViewModel = .Bets
    @Environment(\.dismiss) private var dismiss
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
            
            postFilterBar
            
            postView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
                        .offset(x: 16, y: 5)
                })
                Circle()
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
                Text("Alan Gloria")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color("mediumgreen"))
            }
            
            Text("@alandev_")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("El desarrollador de esta app")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Coahuila, MX")
                }
                
                HStack{
                    Image(systemName: "link")
                    Text("www.alandev.com")
                }
            }.font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24){
                
                HStack(spacing: 4){
                    Text("109")
                        .font(.subheadline)
                        .bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    Text("1M")
                        .font(.subheadline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }.padding(.vertical)
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
                    PostRowView()
                        .padding()
                }
            }
        }

    }
}
