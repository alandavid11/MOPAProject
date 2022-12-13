//
//  ExploreView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.searchableUsers){
                        user in NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }

                    }
                }
                
            }
            
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
