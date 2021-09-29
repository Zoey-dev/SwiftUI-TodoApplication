//
//  TaskListViewModel.swift
//  My-Todo
//
//  Created by Princess  on 06/09/2021.
//

import Foundation
import Combine

//needs to be an observable so that swiftUI can observe all changes made to this viewmodel
class TaskCellViewModel: ObservableObject, Identifiable {
    //this needs to be published so that changes can be listened to
    //each of the task cell view models should hold a refernce to the task
    @Published var task: Task
    var id = ""
    //this is the icon that will show a completed task
    @Published var completionStateIconName = ""
    private var cancellable = Set<AnyCancellable>()
    @Published var taskRepository = TaskRepository()
    
    init(task: Task) {
        self.task = task
        
        //run a map operation on the task. transform the task into a string, so use the map(tranform) option
        $task
            .map{task in
                task.completed ? "square.fill" : "square"
            }
            
        //assign the result of the map operation to the completionStateIconName property
            .assign(to: \.completionStateIconName, on: self)
        
            
            //then we need to keep track of our subscribers and store them to a cancellable and we can do that by first importing combine then do line 20
            .store(in: &cancellable)
        
        $task
            .compactMap{task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellable)
        
        //when there is an update or edit on the tasks we push it through the repository and move to firebase
        //to ensure that updates are sent only when edit has stopped we use the debounce operator
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                self.taskRepository.updateTask(task)
            }
            .store(in: &cancellable)
    }
}
