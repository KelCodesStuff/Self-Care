//
//  PoemController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 1/27/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase

class PoemController: UIViewController {
    
    lazy var poemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poem_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(poemImageView)
        
        setupPoemImageView()

    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    var poemImageViewHeightAnchor: NSLayoutConstraint?
    
    func setupPoemImageView() {
        //need x, y, width, height constraints
        poemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poemImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        poemImageView.widthAnchor.constraint(equalToConstant: -50).isActive = true
        poemImageView.heightAnchor.constraint(equalToConstant: 700).isActive = true
    }
}
