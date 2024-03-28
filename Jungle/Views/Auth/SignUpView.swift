

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [.yellow, Color.yellow,(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))), ]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(){
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height:100)
                            .clipShape(Circle())
                        
                        
                            .padding(.top, 40)
                    } else {
                        Button(action:{ imagePickerPresented.toggle()}, label: {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height:100)
                                .foregroundColor(.white)
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                        .padding(.top, 40)
                    }
                }
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder:
                                        Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.50)))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    
                    
                    CustomTextField(text: $username,placeholder:
                                        Text("Username"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.50)))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullname, placeholder:
                                        Text("Full Name"), imageName: "square.text.square")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.50)))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    
                    
                    CustomSecureField(text: $password,
                                      placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.50)))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)
                    
                    
                    
                }
                
                Button(action: {viewModel.register(withEmail: email, password: password, image: selectedImage, fullname:fullname,username: username)
                    
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1)))
                        .clipShape(Capsule())
                    
                        .padding()
                })
                Spacer()
                
                
                Button(action: {mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text(" Have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system (size: 14, weight:
                                    .semibold))
                    }.foregroundColor(.black)
                })
                
            }.padding(.top, -44)
        }
    }
}
 

extension SignUpView {
    func loadImage() {
    guard let selectedImage = selectedImage else {return}
    image = Image(uiImage: selectedImage)
                                 }
                             }

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
