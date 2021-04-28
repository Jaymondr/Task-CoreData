//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//

import UIKit
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell, UITableViewDelegate {
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    private var completionButtonTapped: Bool = false
    var date: Date?
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    

    
    
    //MARK: - Actions
    
    @IBAction func completionButtonTapped(_ sender: Any) {
//        guard let task = task  else {return}
        completionButtonTapped.toggle()
        
        
        delegate?.taskCellButtonTapped(self)
    }
    
    
    func updateViews() {
        guard let task = task else {return}
        
        taskNameLabel.text = task.name
        dueDateLabel.text = task.dueDate?.formatToString()
        let complete = UIImage(named: "complete")
        if task.isComplete {
            completionButton.setBackgroundImage(complete, for: .normal)
        }else{
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}

