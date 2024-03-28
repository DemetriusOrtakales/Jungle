

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                Text(viewModel.message.text)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
                    .font(.body)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(URL(string: viewModel.message.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .font(.body)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                }
                .padding(.horizontal)
                .padding(.trailing, 100)
                .padding(.leading, 16)
                Spacer()
            }
        }
    }
}
