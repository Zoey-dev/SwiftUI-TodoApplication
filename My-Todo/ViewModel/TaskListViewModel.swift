//
//  TaskListViewModl.swift
//  My-Todo
//
//  Created by Princess  on 06/09/2021.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        //for each task we get, return the task cell and send in the current task
        taskRepository.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
        }
            .assign(to: \.taskCellViewModels, on: self)
            .store(in: &cancellable)
        
            }
    
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
//        let taskVM = TaskCellViewModel(task: task)
//        self.taskCellViewModels.append(taskVM)
    }
}
