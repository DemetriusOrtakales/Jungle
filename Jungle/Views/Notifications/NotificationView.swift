

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationViewModel()
    
    
    
    
    var body: some View {
     
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.notifications) { notification in
                    NotificationsCell(viewModel:
                    NotificationCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
  
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
