//
//  WorkoutController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 2/9/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit

class WorkoutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 254, g: 254, b: 254)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(workoutImageView)
        
        setupWorkoutImageView()
        
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    let workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "workout_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupWorkoutImageView() {
        //need x, y, width, height constraints
        workoutImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        workoutImageView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        workoutImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        workoutImageView.heightAnchor.constraint(equalToConstant: -100).isActive = true
    }
    
}
