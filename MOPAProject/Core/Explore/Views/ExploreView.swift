//
//  ExploreView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0 ... 25, id: \.self){
                            _ in
                            NavigationLink(destination: ProfileView())
                             {
                                UserRowView()
                             }
                            
                        }
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            
                
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
