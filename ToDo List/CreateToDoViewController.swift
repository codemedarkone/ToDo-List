//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by chris  on 9/18/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var toDoTableVC: ToDoTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addToDoButton(_ sender: UIButton) {

        let toDo = ToDo()
        if let titleText = titleTextField.text {
            toDo.name = titleText

            toDo.important = importantSwitch.isOn

            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()

            navigationController?.popViewController(animated: true)
        }
    }
    

 

}
