//
//  NewPostView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 05/12/22.
//

import SwiftUI

struct NewPostView: View {
    @State private var caption = ""
    @Environment(\.dismiss) private var dismiss
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
                    print("Post")
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
                Circle()
                    .frame(width: 64, height: 64)
                
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
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
