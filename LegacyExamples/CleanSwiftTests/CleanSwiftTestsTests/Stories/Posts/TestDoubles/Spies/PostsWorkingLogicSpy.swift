//
//  PostsWorkingLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class PostsWorkingLogicSpy: PostsWorkingLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledFetchPosts = false
  
  // MARK: - Public Methods
  
  func fetchPosts(userId: Int, _ completion: @escaping ([Post]?) -> Void) {
    isCalledFetchPosts = true
    completion(nil)
  }
}
