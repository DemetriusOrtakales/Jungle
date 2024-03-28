
import SwiftUI
import Kingfisher

struct CommentsCell: View {
     let comment: Comment
    
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .frame(width: 36, height: 36)
                .clipped()
                .cornerRadius(18)
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)").foregroundColor(.black).font(.system(size: 14))
                
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 14))
                .padding(.trailing)
         
        }.padding(.horizontal)
    }
}

























































