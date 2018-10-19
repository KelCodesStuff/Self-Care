/// Copyright (c) 2018 

import UIKit
import Sentry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    AppController.shared.show(in: UIWindow(frame: UIScreen.main.bounds))
    
    // Create a Sentry client and start crash handler
    do {
        Client.shared = try Client(dsn: "https://3122d527176d44aa8beccdc1eb066ad5@sentry.io/1304899")
        try Client.shared?.startCrashHandler()
    } catch let error {
        print("\(error)")
    }
    
    return true
  }
}

