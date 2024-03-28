
import SwiftUI


struct CommentInputView: View {
    
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        
        VStack {
            
            
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)

            
            HStack {
                
                TextField("Add a Comment...", text: $inputText)
                    .frame(minHeight: 35)
                    .autocapitalization(.none)
                    .padding(20)
                             
                                        .overlay(
                                            Capsule()
                                                .stroke(lineWidth: 3)
                                                .frame(width: 320, height: 35)
                                                .foregroundColor(.yellow)
        
                                        )

                                            
                                        
                Button(action: action) {
                    Text("Post")
                        .bold()
                        .foregroundColor(.yellow)
                        .padding(10)
                }
             
                
            }
        }
       
         

    }
}
