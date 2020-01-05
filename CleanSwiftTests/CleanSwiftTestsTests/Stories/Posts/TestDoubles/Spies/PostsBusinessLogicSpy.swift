//
//  HomeBusinessLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class PostsBusinessLogicSpy: PostsBusinessLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledFetchPosts = false
  
  // MARK: - Public Methods
  
  func fetchPosts(_ request: PostsModels.FetchPosts.Request) {
    isCalledFetchPosts = true
  }
}
