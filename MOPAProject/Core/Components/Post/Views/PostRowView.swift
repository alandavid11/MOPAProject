//
//  PostRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    @ObservedObject var viewModel: PostRowViewModel
    
    init(post: Post) {
        self.viewModel = PostRowViewModel(post: post)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            // Imagen de perfil + informacion de usuario + post
            if let user = viewModel.post.user {
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                        
                    
                    // Informacion de ususario + titulo del post
                    VStack(alignment: .leading, spacing: 6){
                        // Informacion de usuario
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("• 3d")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // Post
                        
                        Text(viewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        
                    }
                    
                }
            }
            // Botones de accion
            HStack{
                Spacer()
                Button(action: {},
                       label: {Image(systemName: "text.line.last.and.arrowtriangle.forward")})
                .font(.subheadline)
                Spacer()
                
                Button(action: {},
                       label: {Image(systemName: "arrow.triangle.merge")})
                .font(.subheadline)
                Spacer()

                Button{
                    viewModel.post.didLike ?? false ?
                    viewModel.unlikePost() : viewModel.likePost()
                }label: {
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                }
                .font(.subheadline)
                .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                Spacer()

                Button(action: {},
                       label: {Image(systemName: "hexagon")})
                .font(.subheadline)
                Spacer()

            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
      
    }
}

//struct PostRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostRowView()
//    }
//}
