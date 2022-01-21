import Foundation
import Firebase

struct User {

    let uid: String
    let email: String

    init(user: FirebaseAuth.User){
        self.uid = user.uid
        self.email = user.email!

    }

}
