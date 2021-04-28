//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//
//import CoreData
import UIKit

class TaskListTableViewController: UITableViewController {
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All", "Incomplete"])
        return sc
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
        //MARK: - Actions
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .systemRed
            tableView.reloadData()
        }
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = .lightGray
            
            tableView.reloadData()
//            if TaskController.shared.toggleIsComplete
        }
    }
    
    
//    var container: NSPersistentContainer?
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.sections[indexPath.section][indexPath.row]
            TaskController.shared.delete(task: task)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.shared.sections[section].count //Change once sections have been created
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTableViewCell else {return UITableViewCell()}
        
        let task = TaskController.shared.sections[indexPath.section][indexPath.row]
        cell.delegate = self
        cell.task = task
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        TaskController.shared.sections.count
    }
//MARK: - Sectioning
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "incomplete"
        }else if section == 1 {
            return "complete"
        }
        return nil
    }
   
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue .identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as?
                    TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = TaskController.shared.sections[indexPath.section][indexPath.row]
            destinationVC.task = task
        }
    }
}//End of class

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.shared.toggleIsComplete(task: task)
        sender.updateViews()
            
        }
}



