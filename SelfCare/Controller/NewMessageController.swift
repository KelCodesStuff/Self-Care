//
//  NewMessageController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class NewMessageController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenu))
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func handleMenu() {
        let newMenuController = MenuController()
        let navController = UINavigationController(rootViewController: newMenuController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleBack() {
        let newMessagesController = MessagesController()
        let navController = UINavigationController(rootViewController: newMessagesController)
        present(navController, animated: true, completion: nil)
    }
}
