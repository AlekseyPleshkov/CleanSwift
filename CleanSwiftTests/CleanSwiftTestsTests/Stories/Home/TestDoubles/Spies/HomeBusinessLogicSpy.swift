//
//  HomeBusinessLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 29.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class HomeBusinessLogicSpy: HomeBusinessLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledFetchUsers = false
  private(set) var isCalledSelectUser = false
  
  // MARK: - Public Methods
  
  func fetchUsers(_ request: HomeModels.FetchUsers.Request) {
    isCalledFetchUsers = true
  }
  
  func selectUser(_ request: HomeModels.SelectUser.Request) {
    isCalledSelectUser = true
  }
}
