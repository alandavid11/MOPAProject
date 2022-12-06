//
//  FeedView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewPostView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id: \.self){ _ in
                        PostRowView()
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
