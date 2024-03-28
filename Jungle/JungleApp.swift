
import SwiftUI
import Firebase



@main
struct JungleApp: App {

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(AuthViewModel.shared)
            
    
        }
    }
}





