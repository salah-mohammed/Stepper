//
//  AppDelegate.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window:UIWindow?

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          self.window = UIWindow(frame: UIScreen.main.bounds)
          window?.rootViewController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateInitialViewController()
          window?.makeKeyAndVisible()

          return true
      }




}

