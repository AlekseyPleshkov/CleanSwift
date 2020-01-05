//
//  PostsRouter.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

@objc protocol PostsRoutingLogic {

}

protocol PostsDataPassing {
  var dataStore: PostsDataStore? { get }
}

final class PostsRouter: NSObject, PostsRoutingLogic, PostsDataPassing {

  // MARK: - Public Properties
  
  // MARK: - Private Properties

  weak var viewController: PostsViewController?
  var dataStore: PostsDataStore?

  // MARK: - PostsRoutingLogic

  // MARK: - Navigation

  // MARK: - Passing data
}
