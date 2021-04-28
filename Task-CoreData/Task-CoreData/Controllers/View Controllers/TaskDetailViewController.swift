//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name =  taskNameTextField.text, !name.isEmpty,
              let  notes = taskNotesTextView.text, !notes.isEmpty
        
        else {return}
        
        if let task = task {
            task.name = name
            task.notes = notes
            task.dueDate = taskDueDatePicker.date
            TaskController.shared.updateTaskDetails(task)
            
        }else{
            TaskController.shared.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        if let dueDate = task.dueDate {
            taskDueDatePicker.date = dueDate
        }
    }
    
//    func getRidOfKeyboard() {
//        UITapGestureRecognizer
//    }
}
