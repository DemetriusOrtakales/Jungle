
import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    
    let placeholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1,
                                                 alpha: 1.0)))
                    .padding(.leading, 40)
            }
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                
                TextField("", text: $text)
            }   .autocapitalization(.none)

        }        

    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
      
        CustomTextField(text: .constant(""), placeholder: Text("email"), imageName: "envelope")
    }
}
