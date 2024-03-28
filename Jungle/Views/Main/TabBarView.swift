
import SwiftUI

var tabs = ["house.fill","magnifyingglass", "plus","message", "person.crop.circle"]

struct TabBarView: View {

    let user: User
    @Binding var selectedTab: String
    @State private var isUploadPostViewPresented = false
    
    var body: some View {
      
        
        NavigationView {
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
               
                
                TabView(selection: $selectedTab){
                    
                    
                    
                    FeedView()
                        .tag("house.fill")
                    
                    
                    ExploreView()
                        .tag("magnifyingglass")
                    
                    UploadPostView(selectedTab: $selectedTab)
                        .tag("plus")
                    
                   
                    ConversationsView()
                        .tag("message")
                    
                    ProfileView(user: user)
                        .tag("person.crop.circle")
                    
                    
                    
                }.navigationTitle(tabTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: settings)
                    .navigationBarItems(trailing: notifications)
                    .accentColor(.black)
                     


                HStack(spacing: 0) {
                    ForEach(tabs, id: \.self) { image in
                        if image == "plus" {
                            Button(action: {
                                isUploadPostViewPresented.toggle()
                            }) {
                                Image(systemName: "\(image)")
                                    .foregroundColor(selectedTab == image ? Color.black : (Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                                    .padding()
                            }
                            .sheet(isPresented: $isUploadPostViewPresented) {
                                UploadPostView(selectedTab: $selectedTab)
                                    .presentationDetents([.height(500), .medium, .large])
                            }
                        } else {
                            TabButton(image: image, selectedTab: $selectedTab)
                        }
                        
                        if image != tabs.last {
                            Spacer(minLength: 0)
                        }
                    }
                }
                .padding(.horizontal, 25)
                    .padding(.vertical, 5)
                    .background(.yellow)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.15), radius: -5, x: -5, y: -5)
                    .padding(.horizontal)
            }.ignoresSafeArea(.keyboard)
               
         
            
            
            
        }
     
    }
    
 
    

    var settings: some View {
        
        NavigationLink(destination: SettingsVIew(), label:  {
            
            Image(systemName: "line.3.horizontal")
                .foregroundColor(.yellow)
        })
        
    }
    
    var notifications: some View {

        NavigationLink(destination: NotificationView(), label:  {

            Image(systemName: "heart")
            .foregroundColor(.yellow)
        })

    }
    
    
    
    var tabTitle: String {
        
        switch selectedTab {
        case "house.fill": return "Feed"
        case "magnifyingglass": return "Explore"
        case "plus": return "Upload"
        case "message": return "Messages"
        case "person.crop.circle": return "Profile"
        default: return ""
        }
        
        
    }
}


struct TabButton: View {
    var image: String
    
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {selectedTab = image}) {
            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color.black: (Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                .padding()
            
        }
    }
    }
   
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
















