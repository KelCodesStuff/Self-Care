//
//  MenuController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class MenuController: UIViewController {
    
    lazy var poemButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 0, g: 100, b: 200)
        button.setTitle("Poem", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleWorkoutButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 0, g: 85, b: 146)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(menuImageView)
        
        setupMenuImageView()
        
        view.addSubview(poemButton)
        view.addSubview(wineButton)
        view.addSubview(recipeButton)
        view.addSubview(workoutButton)

        setupPoemButton()
        setupWineButton()
        setupRecipeButton()
        setupWorkoutButton()

    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
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
        menuImageView.widthAnchor.constraint(equalToConstant: 415).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: -90).isActive = true
    }

    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}






