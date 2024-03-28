

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    let id: String
    let fromId: String
    let toId: String
    let timestamp: Timestamp
    let username: String
    let profileImageUrl: String
    let text: String
    let fullname: String
    
    var chatPartnerId: String { return fromId == Auth.auth().currentUser?.uid ? toId : fromId }
    
    var timestampString: String? {
           let formatter = DateComponentsFormatter()
           formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
           formatter.maximumUnitCount = 1
           formatter.unitsStyle = .abbreviated
           return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
       }
}
