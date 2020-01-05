//
//  AppDelegate.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: - Public Properties

  var window: UIWindow?
  
  // MARK: - Public Methods
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let initialViewController = AppHelper.createInitialController()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = initialViewController
    window?.makeKeyAndVisible()
    
    return true
  }
}

