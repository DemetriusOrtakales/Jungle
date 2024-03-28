
import SwiftUI


struct MessageInputView: View {
    
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        
        
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)

            
            HStack {
                TextField("Message...", text: $inputText, axis: .vertical)
               
                    .autocapitalization(.none)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())

                                            
                                        


                Button(action: action) {
                   Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 32 , height: 32)
                        .foregroundColor(.yellow)
                       
                        
                }
                
                
            }
        }
         

    }
}
