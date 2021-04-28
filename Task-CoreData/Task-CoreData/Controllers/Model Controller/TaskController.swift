//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//
import CoreLocation
import CoreData

class TaskController {
    

static let shared = TaskController()
    
    var tasks: [Task] = []
    var sections: [[Task]] { [incompletedTasks, completedTasks] }
    var completedTasks: [Task] = []
    var incompletedTasks: [Task] = []
    
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - CRUD Functions
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(notes: notes, name: name, dueDate: dueDate)
        incompletedTasks.append(task)
        CoreDataStack.saveContext()
        
    }
    
    func fetchTasks() {
        let tasks = (try?
            CoreDataStack.context.fetch(self.fetchRequest)) ?? []
//        add completed and incompleted task filter here and delete below lines x2
//        print(tasks.count)
//        incompletedTasks = tasks.filter { !$0.incompletedTask }
//        completedTasks = tasks.filter { $0.incompletedTask }
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
    
    func updateTaskDetails(_ task: Task) {
        CoreDataStack.saveContext()
    }
    
    func delete(task: Task)  {
        if let taskToDelete = tasks.firstIndex(of: task) {
            tasks.remove(at: taskToDelete)
            CoreDataStack.context.delete(task)
            CoreDataStack.saveContext()
        }

    }
    
}//End of class


