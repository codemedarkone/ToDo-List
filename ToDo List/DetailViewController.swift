//
//  DetailViewController.swift
//  ToDo List
//
//  Created by chris  on 9/18/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var previousVC = ToDoTableViewController()
    var selectedToDo: ToDoCoreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = selectedToDo?.name
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let selectedItem = selectedToDo else { return }
        managedContext.delete(selectedItem)
        navigationController?.popViewController(animated: true)
        
//        var index = 0
//        for toDo in previousVC.toDos {
//            if toDo.name == selectedToDo.name {
//                previousVC.toDos.remove(at: index)
//                previousVC.tableView.reloadData()
//                navigationController?.popViewController(animated: true)
//                break
//            }
//            index += 1
//        }
    }
}
