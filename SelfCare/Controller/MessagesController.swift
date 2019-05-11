//
//  ViewController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class MessagesController: UIViewController {
    
    lazy var chatButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Chat", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleChatButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var poemButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Poem", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handlePoemButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var wineButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Wine Recomendations", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleWineButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var recipeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Recipes", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleRecipeButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var workoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Workout", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleWorkoutButton), for: .touchUpInside)
        
        return button
    }()
    
 //   let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
/*
        let image = UIImage(named: "new_message_icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
*/
        checkIfUserIsLoggedIn()
        
//        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        //        observeMessages()
        
/*
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        items.append( UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenu)))
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        self.toolbarItems = items
*/
        
        view.addSubview(menuImageView)
        
        setupMenuImageView()
        
        view.addSubview(chatButton)
        view.addSubview(poemButton)
        view.addSubview(wineButton)
        view.addSubview(recipeButton)
        view.addSubview(workoutButton)
        
        setupChatButton()
        setupPoemButton()
        setupWineButton()
        setupRecipeButton()
        setupWorkoutButton()
        
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserAndSetupNavBarTitle()
        }
    }
    
    func fetchUserAndSetupNavBarTitle() {
        guard let uid = Auth.auth().currentUser?.uid else {
            //for some reason uid = nil
            return
        }
        
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                //                self.navigationItem.title = dictionary["name"] as? String
                
                let user = User(dictionary: dictionary)
                self.setupNavBarWithUser(user)
            }
            
        }, withCancel: nil)
    }
    
    func setupNavBarWithUser(_ user: User) {
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        //        titleView.backgroundColor = UIColor.redColor()
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(containerView)
        
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        if let profileImageUrl = user.profileImageUrl {
            profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
        }
        
        containerView.addSubview(profileImageView)
        
        //ios 9 constraint anchors
        //need x,y,width,height anchors
        profileImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let nameLabel = UILabel()
        
        containerView.addSubview(nameLabel)
        nameLabel.text = user.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        //need x,y,width,height anchors
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
        
        //        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showChatController)))
    }
    
    func showChatControllerForUser(_ user: User) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        loginController.messagesController = self
        present(loginController, animated: true, completion: nil)
    }
    
    @objc func handleNewMessage() {
        let newMessageController = NewMessageController()
        newMessageController.messagesController = self
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleChatButton() {
        let newMessageController = NewMessageController()
        newMessageController.messagesController = self
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handlePoemButton() {
        let newPoemController = PoemController()
        let navController = UINavigationController(rootViewController: newPoemController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleWineButton() {
        let newWineController = WineController()
        let navController = UINavigationController(rootViewController: newWineController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleRecipeButton() {
        let newRecipeController = RecipeController()
        let navController = UINavigationController(rootViewController: newRecipeController)
        present(navController, animated: true, completion: nil)
    }
    
    @objc func handleWorkoutButton() {
        let newWorkoutController = WorkoutController()
        let navController = UINavigationController(rootViewController: newWorkoutController)
        present(navController, animated: true, completion: nil)
    }
    
    // Buttons
    func setupChatButton() {
        //need x, y, width, height constraints
        chatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chatButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -180).isActive = true
        chatButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupPoemButton() {
        //need x, y, width, height constraints
        poemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poemButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -90).isActive = true
        poemButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        poemButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupWineButton() {
        //need x, y, width, height constraints
        wineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wineButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        wineButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        wineButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupRecipeButton() {
        //need x, y, width, height constraints
        recipeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recipeButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive = true
        recipeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        recipeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupWorkoutButton() {
        //need x, y, width, height constraints
        workoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        workoutButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 180).isActive = true
        workoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        workoutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // Background image
    func setupMenuImageView() {
        //need x, y, width, height constraints
        menuImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuImageView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        menuImageView.widthAnchor.constraint(equalToConstant: 900).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: -90).isActive = true
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
}

