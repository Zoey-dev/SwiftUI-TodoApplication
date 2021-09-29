//
//  TaskRepository.swift
//  My-Todo
//
//  Created by Princess  on 11/09/2021.
//

//this file connects the view model to the storage
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

//making this an observableobjects will allow us liten to any updates made by any publishers
class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    //listening to the collection on firebase
    func loadData() {
        let userID = Auth.auth().currentUser?.uid
        
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userID", isEqualTo: userID!)
            .addSnapshotListener { querySnapshot, error in
            //if the querysnapshot is not nill then take all the documents that has been fetched by it and interate(using compact map) over the documents then get a single document and map it to a task
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    try? document.data(as: Task.self)
                }
            }
        }
    }
    
    
    func addTask (_ task: Task) {
        do {
            var addedTask = task
            addedTask.userID = Auth.auth().currentUser?.uid
            let _ = try db.collection("tasks").addDocument(from: addedTask)
        } catch {
            fatalError("There was an error")
        }
        
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            } catch {
                fatalError("There was an error")
            }

        }
    }
    
}

