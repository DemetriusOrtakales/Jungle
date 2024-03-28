
import SwiftUI

struct SettingsVIew: View {
    
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    Button {
                        AuthViewModel.shared.signout()
                    } label: {
                        Text("Logout").foregroundColor(.red)
                    }
                  
                    
                 

}

          }
                     
                                    Section() {
                                        Button {
                                            AuthViewModel.shared.signout()
                                        } label: {
                                            Text("Logout").foregroundColor(.red)
                                        }

                    
                }
                
                
            }.navigationTitle("Settings")
                .listStyle(GroupedListStyle()).listStyle(GroupedListStyle())
        }
        
    }



struct SettingsVIew_Previews: PreviewProvider {
    static var previews: some View {
        SettingsVIew()
    }
}
