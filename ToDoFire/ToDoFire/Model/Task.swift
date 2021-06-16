////
////  Task.swift
////  ToDoFire
////
////  Created by Ernest Migranov on 15.06.2021.
////
//
//import Foundation
//import Firebase
//import FirebaseDatabase
//
//struct Task {
//    let title: String
//    let userId: String
//    var ref:DatabaseReference!
//    var completed: Bool = false
//    
//    init(title: String, userId: String){
//        self.title = title
//        self.userId = userId
//        self.ref = nil
//    }
//    
//    init(snapshot: DataSnapshot){
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        title = snapshotValue["title"] as! String
//        userId = snapshotValue["userId"] as! String
//        completed = snapshotValue["completed"] as! Bool
//        ref = snapshot.ref
//    }
//}
