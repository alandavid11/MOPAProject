//
//  FeedView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewPostView = false
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.posts){ post in
                        PostRowView(post: post)
                            .padding()
                        
                    }
                }
            }
            Button {
                showNewPostView.toggle()
            } label: {
                Image(systemName: "goforward.plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding(15)
            }
            .background(Color("mediumgreen"))
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewPostView) {
                NewPostView()
            }

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
