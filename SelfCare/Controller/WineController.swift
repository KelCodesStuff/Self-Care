//
//  WineController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 1/27/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase

class WineController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 254, g: 254, b: 254)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(wineImageView)
        
        setupWineImageView()

    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    let wineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wine_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupWineImageView() {
        //need x, y, width, height constraints
        wineImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wineImageView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wineImageView.widthAnchor.constraint(equalToConstant: 402).isActive = true
        wineImageView.heightAnchor.constraint(equalToConstant: -100).isActive = true
    }

}
