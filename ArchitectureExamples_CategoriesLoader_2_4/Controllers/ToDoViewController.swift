//
//  ToDoViewController.swift
//  ArchitectureExamples_CategoriesLoader_2_4
//
//  Created by Лаура Есаян on 29.02.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import UIKit
import Bond

class ToDoViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    let toDoViewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First screen initialization with data from persistence memory
        for savedTask in toDoViewModel.getSavedTasks() {
            toDoViewModel.tasksList.append(savedTask)
        }
        
        plusButton.reactive.tap.observe(with: { [weak self] _ in
            self?.toDoViewModel.addTask(task: (self?.toDoTextField.text)!)
            self?.toDoTextField.text = ""
            }).dispose(in: bag)
        
        // Reactive removing tasks from table view and Realm
        toDoTableView.reactive.selectedRowIndexPath
            .map{$0.row}
            .observeNext(with: { [weak self] row in
            self?.toDoViewModel.remove(task: row)
        }).dispose(in: bag)
        
        toDoViewModel.tasksList.bind(to: toDoTableView) { (dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoTableViewCell
            cell.toDoLabel.text = dataSource[indexPath.row]
            
            return cell
        }
    }
}
