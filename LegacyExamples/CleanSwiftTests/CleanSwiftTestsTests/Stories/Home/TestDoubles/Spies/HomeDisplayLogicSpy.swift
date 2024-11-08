//
//  HomeViewControllerSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 29.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class HomeDisplayLogicSpy: HomeDisplayLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledDisplayFetchedUsers = false
  private(set) var users: [User] = []
  
  // MARK: - Public Methods
  
  func displayFetchedUsers(_ viewModel: HomeModels.FetchUsers.ViewModel) {
    isCalledDisplayFetchedUsers = true
    users = viewModel.users
  }
}
