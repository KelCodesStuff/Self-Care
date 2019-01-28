//
//  MenuController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase

class MenuController: UIViewController {
    
    lazy var poemButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 100, b: 160)
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
        button.backgroundColor = UIColor(r: 80, g: 100, b: 160)
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
        button.backgroundColor = UIColor(r: 80, g: 100, b: 160)
        button.setTitle("Recipes", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleRecipeButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handlePoemButton() {
        
    }
    
    @objc func handleWineButton() {
        
    }
    
    @objc func handleRecipeButton() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 10, g: 50, b: 160)
        
        view.addSubview(poemButton)
        view.addSubview(wineButton)
        view.addSubview(recipeButton)
        
        setupPoemButton()
        setupWineButton()
        setupRecipeButton()
    }
    
    // Buttons
    func setupPoemButton() {
        //need x, y, width, height constraints
        poemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poemButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        poemButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        poemButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupWineButton() {
        //need x, y, width, height constraints
        wineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wineButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        wineButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        wineButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupRecipeButton() {
        //need x, y, width, height constraints
        recipeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recipeButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        recipeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        recipeButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}






