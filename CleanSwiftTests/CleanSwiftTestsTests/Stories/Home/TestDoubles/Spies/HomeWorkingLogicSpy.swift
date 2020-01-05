//
//  HomeWorkingLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class HomeWorkingLogicSpy: HomeWorkingLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledFetchUsers = false
  
  let users: [User] = [
    User(id: 1, name: "Ivan", username: "ivan91"),
    User(id: 2, name: "Igor", username: "igor_test")
  ]
  
  // MARK: - Public Methods
  
  func fetchUsers(_ completion: @escaping ([User]?) -> Void) {
    isCalledFetchUsers = true
    completion(users)
  }
}
