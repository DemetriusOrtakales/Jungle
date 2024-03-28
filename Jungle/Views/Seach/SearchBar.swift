
import SwiftUI

struct SearchBar: View {
   
    @Binding var text: String
    @Binding var isEditing: Bool
    // binded to iSearchmode
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity,
                                   alignment: .leading)
                        .padding(.leading, 8)
                    })
                .onTapGesture {
                    isEditing = true
                    text = ""
                    UIApplication.shared.endEditing()
                }
            if isEditing {
                Button(action: { isEditing = false
                    
                }, label:  {
                    Text("Cancel")
                    .foregroundColor((Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .top))
             
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
