//
//  AppSettings.swift
//  Controllers
//
//  Created by Kelvin Reid on 10/01/18.
//  Copyright © 2018 Kelvin Reid. All rights reserved.
//

import Foundation

final class AppSettings {
  
  private enum SettingKey: String {
    case displayName
  }
  
  static var displayName: String! {
    get {
      return UserDefaults.standard.string(forKey: SettingKey.displayName.rawValue)
    }
    set {
      let defaults = UserDefaults.standard
      let key = SettingKey.displayName.rawValue
      
      if let name = newValue {
        defaults.set(name, forKey: key)
      } else {
        defaults.removeObject(forKey: key)
      }
    }
  }
  
}
