//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by chris  on 9/18/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
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

  
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
             cell.textLabel?.text = toDo.name
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
            
            if let toDo = sender as? ToDo {
                detailVC.selectedToDo = toDo
                detailVC.previousVC = self
            }
            
        }
    }

}
