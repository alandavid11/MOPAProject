//
//  NewPostView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 05/12/22.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @State private var caption = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var authviewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color.red)
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadPost(withCaption: caption)
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("mediumgreen"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }.padding()
            
            HStack(alignment: .top){
                if let user = authviewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                
                ZStack(alignment: .topLeading) {
                           TextEditor(text: $caption)
                        .padding(4)

                           if caption.isEmpty {
                               Text("Que vas a apostar hoy?")
                                   .foregroundColor(Color(.placeholderText))
                                   .padding(.horizontal, 8)
                                   .padding(.vertical, 12)
                           }
                       }
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadPost) { success in
            if success {
                dismiss()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
