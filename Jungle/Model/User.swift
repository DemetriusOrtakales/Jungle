import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    
   
    var email: String
    var fullname: String
    var username: String
    var profileImageUrl: String
    var bio: String?
    @DocumentID var id: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
  
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    
    init(message: Message) {
        self.username = message.username
        self.id = message.chatPartnerId
        self.fullname = message.fullname
        self.email = ""
        self.profileImageUrl = message.profileImageUrl
    }
    
}


struct UserStats: Codable {
    var following: Int
    var posts: Int
    var followers: Int
    
}

