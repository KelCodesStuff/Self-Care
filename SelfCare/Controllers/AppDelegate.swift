//
//  AppDelegate.swift
//  Controllers
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2018 Kelvin Reid. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    AppController.shared.show(in: UIWindow(frame: UIScreen.main.bounds))
    return true
  }
}

