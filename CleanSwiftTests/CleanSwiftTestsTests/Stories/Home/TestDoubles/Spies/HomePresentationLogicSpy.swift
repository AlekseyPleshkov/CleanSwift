//
//  HomePresentationLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class HomePresentationLogicSpy: HomePresentationLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledPresentFetchedUsers = false
  
  // MARK: - Public Methods
  
  func presentFetchedUsers(_ response: HomeModels.FetchUsers.Response) {
    isCalledPresentFetchedUsers = true
  }
}
