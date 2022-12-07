//
//  CustomImputFields.swift
//  MOPAProject
//
//  Created by Alan Gloria on 06/12/22.
//

import SwiftUI

struct CustomImputFields: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomImputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomImputFields(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
