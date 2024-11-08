//
//  HomeRouter.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
  func routeToDetail(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

  // MARK: - Private

  // MARK: - Public

  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

  // MARK: - HomeRoutingLogic

  func routeToDetail(segue: UIStoryboardSegue?) {
    if let segue = segue {
      guard
        let homeDS = dataStore,
        let detailVC = segue.destination as? DetailViewController,
        var detailDS = detailVC.router?.dataStore
        else { fatalError("Fail route to detail") }

      passDataToDetail(source: homeDS, destination: &detailDS)
    } else {
      guard
        let viewController = viewController,
        let homeDS = dataStore,
        let storyboard = viewController.storyboard,
        let detailVC = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController,
        var detailDS = detailVC.router?.dataStore
        else { fatalError("Fail route to detail") }

      passDataToDetail(source: homeDS, destination: &detailDS)
      navigateToDetail(source: viewController, destination: detailVC)
    }
  }

  // MARK: - Navigation

  private func navigateToDetail(source: HomeViewController, destination: DetailViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }

  // MARK: - Passing data

  private func passDataToDetail(source: HomeDataStore, destination: inout DetailDataStore) {
    destination.message = source.message
  }
}
