//
//  HomeRouter.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
  func routeToPosts()
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

  // MARK: - Public Properties

  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

  // MARK: - HomeRoutingLogic

  func routeToPosts() {
    let postsViewController = AppStoryboard.Posts.viewController(
      PostsViewController.self,
      identity: .PostsViewController)
    
    guard var postsDataStore = postsViewController.router?.dataStore else {
      return
    }

    passDataToPosts(destination: &postsDataStore)
    navigateToPosts(destination: postsViewController)
  }

  // MARK: - Navigation

  private func navigateToPosts(destination: PostsViewController) {
    viewController?.navigationController?.pushViewController(destination, animated: true)
  }

  // MARK: - Passing data

  private func passDataToPosts(destination: inout PostsDataStore) {
    destination.user = dataStore?.selectedUser
  }
}
