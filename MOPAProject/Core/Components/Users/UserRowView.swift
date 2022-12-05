//
//  UserRowView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
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
        }.padding(.horizontal).padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
