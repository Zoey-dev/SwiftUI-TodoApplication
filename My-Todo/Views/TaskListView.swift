//
//  TaskListView.swift
//  My-Todo
//
//  Created by Princess  on 04/09/2021.
//

import SwiftUI
import Firebase


struct TaskListView: View {
  
    //we need to bind the view model to the ui so we use the observable object to instantiate the class
    @StateObject var taskListVM = TaskListViewModel()
    @State var displayName = "Princess Ugee"
    @State var addNewItem = false
    @State var showWelcomePage = false
    
    var body: some View {
        ZStack{
            VStack{
                TopDesign()
                Spacer()
                
                    Image("userimage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(150)
                                .padding()
                    Text("Welcome \(displayName)")
                        .bold()
                    
                
                Text("ToDo List")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(10.0)
                
                
                ScrollViewReader { scrollview in
                    ScrollView(.vertical) {
                        VStack(spacing: 10) {
                            ForEach(taskListVM.taskCellViewModels, id: \.id) { taskCellVM in
                                Divider()
                                TaskCell(taskCellVM: taskCellVM)
                            }
                        }
                    }
                    
                    if addNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListVM.addTask(task: task)
                            self.addNewItem.toggle()
                            
                        }
                        
                    }

                }.padding()
    
                Button(action: {self.addNewItem.toggle()}) {
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))
                 }
                
                
                Spacer()
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().previewDevice("iPhone 12")
        
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = {_ in}
    
    var body: some View {
        HStack {
            Image(systemName: taskCellVM.task.completed ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
                .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.79))

            TextField("Enter a new task", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}
