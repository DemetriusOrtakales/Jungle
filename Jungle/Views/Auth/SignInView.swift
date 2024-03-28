import SwiftUI



struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        
        NavigationView{
            ZStack {
                LinearGradient(gradient:
                                Gradient(colors: [.yellow, Color.yellow,(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))), ]),
                               startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(){
                    Text("")
             
                        .scaledToFit()
                        .frame(width: 220, height:220)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder:
                                            Text("Email"), imageName: "envelope")
                        .padding()
                                         
                        
                        .background(Color(.init(white: 1, alpha: 0.50)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.horizontal, 32)
                        .disableAutocorrection(true)
                        
                        
                        
                        CustomSecureField(text: $password,
                                          placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.50)))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .padding(.horizontal, 32)
                        
                        
                        
                        
                        
                    }
                
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ResetPasswordView(email: $email),
                        label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.top)
                                    .padding(.trailing, 28)
                        
                    
                        })
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, pasword: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1)))
                            .clipShape(Capsule())
                    
                        
                            .padding()
                    })
                    Spacer()
                    
                    NavigationLink( destination: SignUpView()
                        .navigationBarHidden(true),
                                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system (size: 14, weight:
                                        .semibold))
                        }.foregroundColor(.black)
                    }).padding(.bottom, 30)
                    
                }.padding(.top, -44)
            }
            
        }
        
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
