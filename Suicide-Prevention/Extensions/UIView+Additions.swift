//
//  UIView+Additions.swift
//  Extensions
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2018 Kelvin Reid. All rights reserved.
//

import UIKit

extension UIView {
  
  func smoothRoundCorners(to radius: CGFloat) {
    let maskLayer = CAShapeLayer()
    maskLayer.path = UIBezierPath(
      roundedRect: bounds,
      cornerRadius: radius
    ).cgPath
    
    layer.mask = maskLayer
  }
  
}
