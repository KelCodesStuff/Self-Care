//
//  WineController.swift
//  
//
//  Created by Kelvin Reid on 1/27/19.
//

import UIKit
import Firebase

class WineController: UIViewController {
    
    lazy var wineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wine_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        view.addSubview(wineImageView)
        
        setupWineImageView()
        
    }
    
    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupWineImageView() {
        //need x, y, width, height constraints
        wineImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wineImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wineImageView.widthAnchor.constraint(equalToConstant: -50).isActive = true
        wineImageView.heightAnchor.constraint(equalToConstant: 650).isActive = true
    }

}
