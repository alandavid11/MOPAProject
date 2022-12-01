//
//  PostRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI

struct PostRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            // Imagen de perfil + informacion de usuario + post
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color.blue)
                
                // Informacion de ususario + titulo del post
                VStack(alignment: .leading, spacing: 6){
                    // Informacion de usuario
                    HStack {
                        Text("Alan Gloria")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@Developing")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("• 3d")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // Post
                    
                    Text("PHI v AZ Un 49")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    
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

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView()
    }
}
