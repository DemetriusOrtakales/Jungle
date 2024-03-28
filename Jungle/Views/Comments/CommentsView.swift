
import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
   
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    var body: some View {
       
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)
                            .padding()
                    }
                }
            }.padding(.top)
            
            
            CommentInputView(inputText: $commentText, action: uploadComment)
            
        }
        
        
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
        
    }

}
















