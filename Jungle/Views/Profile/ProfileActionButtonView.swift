
import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false}
    @State var showEditProfile = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            
            
            Button(action:  {showEditProfile.toggle() }, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.white)
                    .background(Color((#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                    .cornerRadius(10)
               
            }).fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: $viewModel.user)
                
            }
            
        } else {
         
            HStack {
                
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .white :
                                .white)
                        .background(isFollowed ? Color.yellow : Color((#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                        .clipShape(Capsule())
                })
                }


            NavigationLink(destination: ChatView(user: viewModel.user)) {
                Text("Message")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 172, height: 32)
                    .background(.yellow)
                    .foregroundColor(.white)
                  
                    .clipShape(Capsule())

            }.navigationBarBackButtonHidden(true)

            
            }
            
          
            
        }
    }

