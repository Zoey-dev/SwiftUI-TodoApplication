//
//  Tasks.swift
//  My-Todo
//
//  Created by Princess  on 04/09/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userID: String?
}

//#if DEBUG
//let testDataTasks = [
//    Task(title: "clean the house", completed: true),
//    Task(title: "mop the floor", completed: false),
//    Task(title: "fold dresses", completed: false)
//]
//#endif
