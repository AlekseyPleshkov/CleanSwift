//
//  PostsPresentationLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class PostsPresentationLogicSpy: PostsPresentationLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledPresentFetchedPosts = false
  
  // MARK: - Public Methods
  
  func presentFetchedPosts(_ response: PostsModels.FetchPosts.Response) {
    isCalledPresentFetchedPosts = true
  }
}
