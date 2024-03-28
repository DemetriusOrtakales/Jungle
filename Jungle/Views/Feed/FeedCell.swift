

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    @State private var isShowingComments = false
    
    var didLike: Bool {return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
   
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            HStack {
                
               
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
          
               
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight:
                                .semibold))
             

               
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Button(action: {
                    
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label:  {
                    
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .yellow : . yellow)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                    
                    
                })

                Button(action: {
                                   isShowingComments.toggle()
                               }) {
                                   Image(systemName: "message")
                                       .resizable()
                                       .scaledToFill()
                                       .foregroundColor(.yellow)
                                       .frame(width: 20, height: 20)
                                       .font(.system(size: 20))
                                       .padding(4)
                               }
                           } .sheet(isPresented: $isShowingComments) {
                               CommentsView(post: viewModel.post)
                             .presentationDetents([.height(500), .medium, .large])
                
                

                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            
            NavigationLink(destination: UserListView(viewModel: SearchViewModel(config: .likes(viewModel.post.id ?? "")), searchText: .constant(""))) {
                Text(viewModel.likeString)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color((#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                    .padding(.leading, 8)
                    .padding(.bottom, 0.5)
            }
            
            
            
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14,
                                                                weight: .semibold)) +
                Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
                
            }.padding(.horizontal, 8)
            
            Text(viewModel.timestampString)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 2)
            
        }
    }
}
