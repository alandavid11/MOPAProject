//
//  FeedView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 30/11/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...20, id: \.self){ _ in
                    PostRowView()
                        .padding()
                    
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
