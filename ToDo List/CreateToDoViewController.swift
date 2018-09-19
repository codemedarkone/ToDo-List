//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by chris  on 9/18/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import CoreData

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

//        let toDo = ToDo()
//        if let titleText = titleTextField.text {
//            toDo.name = titleText
//
//            toDo.important = importantSwitch.isOn
//
//            previousVC.toDos.append(toDo)
//            previousVC.tableView.reloadData()
//
//            navigationController?.popViewController(animated: true)
//        }
        
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //        let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: managedContext)
            
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: managedContext)
//            guard let entity = NSEntityDescription.entity(forEntityName: "ToDoCoreData", in: managedContext) else { return }
            
//            guard let entity = theEntity else { return }
            
//            let toDoCoreData = NSManagedObject(entity: entity, insertInto: managedContext)
//
//            toDoCoreData.setValue(name, forKey: "name")
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
                
            }
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("failed to save the data!", error.localizedDescription)
            }
            
            navigationController?.popViewController(animated: true)
        
    }
    

 

}
