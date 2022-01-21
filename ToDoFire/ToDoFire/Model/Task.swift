//
//  Task.swift
//  ToDoFire
//
//  Created by Ernest Migranov on 15.06.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Task {
    let title: String
    let userId: String
    var ref: DatabaseReference?
    var completed: Bool = false
    
    init(title: String, userId: String){
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot){
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userId = snapshotValue["userId"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["title": title,"userId":userId,"completed":completed]
    }
}

struct Profile{
    let name: String
    let course: String
    let status: String
    let userId: String
    var ref: DatabaseReference?
    
    init(name: String, course: String,status: String,userId: String){
        self.name = name
        self.course = course
        self.status = status
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot){
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        course = snapshotValue["course"] as! String
        status = snapshotValue["status"] as! String
        userId = snapshotValue["userId"] as! String
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["name": name,"course":course, "status": status, "userId":userId]
    }
}
