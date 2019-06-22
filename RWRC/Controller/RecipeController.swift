//
//  RecipeController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 1/27/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase

class RecipeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 254, g: 254, b: 254)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(recipeImageView)
        
        setupRecipeImageView()

    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "recipe_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupRecipeImageView() {
        //need x, y, width, height constraints
        recipeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recipeImageView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recipeImageView.widthAnchor.constraint(equalToConstant: 450).isActive = true
        recipeImageView.heightAnchor.constraint(equalToConstant: -100).isActive = true
    }

}
