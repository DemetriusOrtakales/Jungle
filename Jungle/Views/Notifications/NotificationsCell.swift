
import SwiftUI
import Kingfisher

struct NotificationsCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool {return viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    
    
    var body: some View {
        
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username)
                    .font(.system(size: 14, weight: .semibold)).foregroundColor(.black) +
                    Text( viewModel.notification.type.notificationMessage)
                        .font(.system(size: 15)).foregroundColor(.black) +
                    Text(" \(viewModel.timestampString)")
                    .foregroundColor(.gray).font(.system(size: 12))
                      
                    
                }
            }
            
            Spacer()
     
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
                
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                Text(isFollowed ? "Following" : "Follow")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 100, height: 32)
                    .foregroundColor(isFollowed ? .white : .white)
                    .background(isFollowed ? Color.yellow : Color((#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                    .clipShape(Capsule())
                    
                  //  .cornerRadius(3)    
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 3)
//                            .stroke(Color.gray, lineWidth:  isFollowed ? 1 : 0)
//                    )
            
                })
            }
            
        }.padding(.horizontal)
     }
    }


