//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by chris  on 9/18/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getToDos()
    }
    
    func createToDos() -> [ToDo] {
        
        let eggs = ToDo()
        eggs.name = "Buy eggs"
        eggs.important = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
    
        let cheese = ToDo()
        cheese.name = "Eat cheese"
        
        return [eggs, dog, cheese]
    }
    
    func getToDos() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDoCoreData")
        
        if let coreDataToDos = try? managedContext.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
            if let theToDos = coreDataToDos {
                toDos = theToDos
                tableView.reloadData()
            }
        }
    }

  
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
            if toDo.important {
                cell.textLabel?.text = "❗️" + name
            } else {
                cell.textLabel?.text = toDo.name
            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addVC = segue.destination as? CreateToDoViewController {
            addVC.previousVC = self
        }
        
        if let detailVC = segue.destination as? DetailViewController {
            
            if let toDo = sender as? ToDoCoreData {
                detailVC.selectedToDo = toDo
                detailVC.previousVC = self
            }
            
        }
    }

}
