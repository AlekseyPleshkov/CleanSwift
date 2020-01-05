//
//  DetailRouter.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

@objc protocol DetailRoutingLogic {

}

protocol DetailDataPassing {
  var dataStore: DetailDataStore? { get }
}

final class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {

  // MARK: - Private

  // MARK: - Public

  weak var viewController: DetailViewController?
  var dataStore: DetailDataStore?

  // MARK: - DetailRoutingLogic

  // MARK: - Navigation

  // MARK: - Passing data
}
