//
//  JournalController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 6/2/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import CoreData

class JournalViewController: UITableViewController {
  
  var people: [NSManagedObject] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Journal"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addEntry))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Journal")
    
    do {
      people = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  @objc func handleBack() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func addEntry(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "New Entry", message: "Add something positive!", preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
      
      guard let textField = alert.textFields?.first,
        let nameToSave = textField.text else {
          return
      }
      
      self.save(name: nameToSave)
      self.tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addTextField()
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    present(alert, animated: true)
  }
  
  @objc func save(name: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Journal", in: managedContext)!
    let journal = NSManagedObject(entity: entity, insertInto: managedContext)
    journal.setValue(name, forKeyPath: "name")
    
    do {
      try managedContext.save()
      people.append(journal)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
}

// MARK: - UITableViewDataSource
extension JournalViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let journal = people[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = journal.value(forKeyPath: "name") as? String
    return cell
  }
}
