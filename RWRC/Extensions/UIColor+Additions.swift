//
//  MenuViewController.swift
//  SelfCare
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var primary: UIColor {
    return UIColor(red: 0 / 255, green: 85 / 255, blue: 146 / 255, alpha: 1)
  }
  
  static var incomingMessage: UIColor {
    return UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
  }
  
}

// Color Extension
extension UIColor {
  
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
    self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
  }
  
}
