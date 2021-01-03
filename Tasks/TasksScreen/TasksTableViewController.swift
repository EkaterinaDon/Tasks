//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Ekaterina on 2.01.21.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    
    
    var task: ToDo?
    var tasks: [ToDo]?
    var firstScreen: Bool = false
    var addNewTask: ((ToDo?, Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTextField.text = task?.name
        addTaskButton()
        
        if firstScreen {
            tasks = SavedTasks().getTasks(with: 7)
            taskTextField.isHidden = true
        } else {
            tasks = task?.subTasks
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if firstScreen {
            return
        }
        
        let taskInProcess = task == nil
        
        if taskInProcess {
            task = Task(name: taskTextField.text ?? "without name", counter: "0")
        } else {
            task?.name = taskTextField.text ?? "no name"
        }
        
        task?.subTasks = tasks ?? []
        addNewTask?(task, taskInProcess)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell", for: indexPath) as! TasksTableViewCell
        
        cell.taskLabel.text = tasks?[indexPath.row].name
        cell.taskCountLabel.text = "\(tasks?[indexPath.row].subTasks.count ?? 0)"

        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openTasksTableViewController(with: tasks?[indexPath.row])
    }
 
    private func addTaskButton() {
        if !(task is SubTask) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed(_:)))
        }
    }
    
    @objc private func addTaskButtonPressed(_ sender: UIBarButtonItem) {
        openTasksTableViewController(with: nil)
    }
    
    private func openTasksTableViewController(with task: ToDo?) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tasks") as? TasksTableViewController {
            vc.task = task
            vc.addNewTask = { [weak self] new, taskInProcess in
                guard let self = self else { return }
                if taskInProcess, let new = new {
                    self.tasks?.append(new)
                    self.task?.subTasks = self.tasks ?? []
                }
                self.tableView.reloadData()
            }
            navigationController?.show(vc, sender: nil)
        }
    }
}
