//
//  HomeRouter.swift
//  CleanSwiftWorker
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
    guard
      let homeVC = viewController,
      let homeDS = dataStore,
      let storyboard = homeVC.storyboard,
      let postsVC = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as? PostsViewController,
      var postsDS = postsVC.router?.dataStore
      else { return }

    passDataToPosts(source: homeDS, destination: &postsDS)
    navigateToPosts(source: homeVC, destination: postsVC)
  }

  // MARK: - Navigation

  private func navigateToPosts(source: HomeViewController, destination: PostsViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }

  // MARK: - Passing data

  private func passDataToPosts(source: HomeDataStore, destination: inout PostsDataStore) {
    destination.user = source.selectedUser
  }
}
