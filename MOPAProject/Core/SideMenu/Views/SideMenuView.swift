//
//  SideMenuView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 04/12/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authviewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Alan Gloria")
                        .font(.headline)
                    
                    Text("@alandev_")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
                    .padding(.vertical)
            }.padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        authviewModel.signOut()
                    } label: {
                        SideMenuOptionView(viewModel: viewModel)
                    }

                } else {
                    SideMenuOptionView(viewModel: viewModel)
                }
              
                
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


