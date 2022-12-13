//
//  PostRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading){
            // Imagen de perfil + informacion de usuario + post
            if let user = post.user {
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
                        
                        Text(post.caption)
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

                Button(action: {},
                       label: {Image(systemName: "heart")})
                .font(.subheadline)
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
