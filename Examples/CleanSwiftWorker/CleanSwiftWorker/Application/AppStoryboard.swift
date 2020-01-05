//
//  AppStoryboard.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
  case Home
  case Posts

  enum Controllers: String {
    case HomeNavigationController
    case PostsViewController
  }

  // MARK: - Public Methods

  var storyboard: UIStoryboard {
    return UIStoryboard(name: rawValue, bundle: Bundle.main)
  }

  func viewController<T: UIViewController>(_ type: T.Type, identity: AppStoryboard.Controllers) -> T {
    guard let controller = storyboard.instantiateViewController(withIdentifier: identity.rawValue) as? T else {
      fatalError("UIViewController with identifier \(identity.rawValue)")
    }

    return controller
  }
}
