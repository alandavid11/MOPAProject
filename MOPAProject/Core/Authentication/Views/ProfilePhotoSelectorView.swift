//
//  ProfilePhotoSelectorView.swift
//  MOPAProject
//
//  Created by Alan Gloria on 11/12/22.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data? = nil
    @State var imagenPerfil:UIImage = UIImage(named: "defaultpp")!
    @State var isProfilePictureSelected = false
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup account.",
                           title2: "Add a profile photo")
            
            // Image picker and change showed photo
            ZStack {
                Image(uiImage: imagenPerfil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 95, height: 95)
                        .clipShape(Circle())
                }
                

                PhotosPicker(selection: $selectedItem,
                    matching: .images,
                             photoLibrary: .shared()){
                    Image(systemName: "camera")
                        .frame(width: 118, height: 118)
                    .foregroundColor(.white)
                }.onChange(of: selectedItem){
                    newItem in Task{
                        if let data = try? await newItem?.loadTransferable(type: Data.self){
                            selectedImageData = data
                            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                            let url = documents.appendingPathComponent("selectedprofilepicture.png")
                            do{
                                try selectedImageData?.write(to: url)
                                imagenPerfil = returnUIImage(named: "selectedprofilepicture")!
                                isProfilePictureSelected = true

                            }catch{
                                print("No se pudo cambiar la fotografia, se produjo el error \(error)")
                            }
                            
                        }
                    }
                }
                                        
            }
            
            
            if isProfilePictureSelected == true {
                
                Button {
                    viewModel.uploadProfileImage(imagenPerfil)
                    dismiss()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color("darkgreen"))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
            }
            Spacer()
        }.ignoresSafeArea()
    }
    
    func returnUIImage(named:String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            return UIImage(contentsOfFile: URL(filePath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
        
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
