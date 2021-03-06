//
//  ProfileView.swift
//  LoginNavigation
//
//  Created by Darrien Huntley on 3/6/21.
//



import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    
    //IMAGE
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image : Image?
    
    func loadImage() {
        guard let selectedImage  = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    
    
    var body: some View {
        if ((auth.user?.isCurrentUser) != nil) {
            
            VStack {
                
                
                //PROFILE IMAGE
                VStack{
                    ZStack {
                        
                        if let image = image {
                            VStack {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .padding(12)
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                                
                                Text("Change Image")
                                    .bold()
                            }
                            
                            
                            
                        } else {
                            
                            Button(action: { showImagePicker.toggle() }) {
                                VStack {
                                    Image("defaultProfileImage")
                                        .padding(12)
                                        .scaledToFill()
                                        .frame(width: 140, height: 140)
                                        .clipShape(Circle())
                                    
                                    Text("Change Image")
                                        .bold()
                                }
                            }
                            
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedUIImage)
                            })
                            
                        }
                    }
                    
                    
                }
                .padding(.bottom, 50)
                
                HStack{
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Username: \(auth.user!.username)")
                            .bold()
                        
                        Text("Email: \(auth.user!.email)")
                            .bold()
                        
                        Text("Full Name: \(auth.user!.fullname)")
                            .bold()
                        
                        Text("Id : \(Auth.auth().currentUser?.uid ?? "[ missing uid ]")")
                        
                        
                        
                    }
                    
                    
                    Spacer()
                }
                .padding()
                
                // code here
                
                
                
                
                
                Spacer()
                
                
                Button(action: {
                    auth.signOut()
                }) {
                    Text("Log Out")
                }
                .padding()
                .padding(.horizontal)
                .background(Color.red)
                .foregroundColor(Color.black)
                .cornerRadius(20)
                
                Spacer().frame(height: 30)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
