import SwiftUI

struct EditProfileView: View {
    @State private var BioText = String()
    @ObservedObject private var viewModel:  EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @Binding var user: User
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._BioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    
    var body: some View {
        VStack {
          
            HStack {
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    Text("Cancel")
                        .foregroundColor(Color((#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                })
                
                Spacer()
                
                Button(action: { viewModel.saveUserBio(BioText) }, label: {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color.yellow)
                })
            }.padding()
            
            TextArea(text: $BioText, placeholder: "Add your bio...")
                .frame(width: 370, height: 70)
                .border(Color.gray)
                .padding()
            Spacer()
          
       }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
        }
                   
        })
        
    }
    
}

