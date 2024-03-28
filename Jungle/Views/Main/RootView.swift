
import SwiftUI




struct RootView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedTab = "house.fill"
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInView()
            } else {
                if let user = viewModel.currentUser {
                    TabBarView(user: user, selectedTab: $selectedTab)
                }
            }
        }
      
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
