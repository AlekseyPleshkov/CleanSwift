//
//  AppHelper.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

struct AppHelper {
  
  static func createInitialController() -> UIViewController {
    let viewController = AppStoryboard.Home.viewController(
      UINavigationController.self,
      identity: .HomeNavigationController)
    
    return viewController
  }
}
