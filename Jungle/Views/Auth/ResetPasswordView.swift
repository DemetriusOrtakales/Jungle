

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [.yellow, Color.yellow,(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))), ]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(){

                Text("")
    
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.white)

                VStack(spacing: 5) {
                    CustomTextField(text: $email, placeholder:
                                        Text("Email"), imageName: "envelope")
                    .padding()
           
                    .background(Color(.init(white: 1, alpha: 0.50)))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.horizontal, 32)

                }
    
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Forgot Password")
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
        .onReceive(viewModel.$didSendResetPasswordLink, perform: {_ in
            self.mode.wrappedValue.dismiss()
        })
        
    }
    
}


