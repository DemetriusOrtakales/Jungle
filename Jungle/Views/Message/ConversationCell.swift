
import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                KFImage(URL(string: message.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.fullname)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.yellow)
                    
                    Text(message.text)
                        .font(.system(size: 15))
                        .lineLimit(2)
                        .foregroundColor((Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                }
                .foregroundColor(.black)
                .padding(.trailing)
                
                Spacer()
            }
            
            Divider()
        }
    }
}
