//
//  UserRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 2){
                Text("@alandev_")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Alan Gloria")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
