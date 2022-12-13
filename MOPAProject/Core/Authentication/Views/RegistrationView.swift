//
//  RegistrationView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 06/12/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        VStack {
            
            AuthHeaderView(title1: "Get started.", title2: "Create your account")
            
            VStack(spacing: 40){
                
                CustomImputFields(imageName: "figure.wave.circle", placeholderText: "Full name", text: $fullname)
                    
                
                CustomImputFields(imageName: "person", placeholderText: "Username", text: $username)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                
                CustomImputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                
                CustomImputFields(imageName: "lock.shield.fill",
                                  placeholderText: "Password",
                                  isSecureField: true,
                                  text: $password)
            }.padding(.horizontal, 32)
                .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
                
                
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color("darkgreen"))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .fullScreenCover(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack{
                    Text("Already have an account")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.bottom, 32)

        }.ignoresSafeArea()
        
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
