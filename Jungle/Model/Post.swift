
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    var user: User?
    var didLike: Bool? = false
 
}

