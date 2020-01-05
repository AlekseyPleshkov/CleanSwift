//
//  PostsDisplayLogicSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation
@testable import CleanSwiftTests

final class PostsDisplayLogicSpy: PostsDisplayLogic {
  
  // MARK: - Public Properties
  
  private(set) var isCalledDisplayFetchedPosts = false
  private(set) var owner: User?
  private(set) var posts: [Post] = []
  
  // MARK: - Public Methods
  
  func displayFetchedPosts(_ viewModel: PostsModels.FetchPosts.ViewModel) {
    isCalledDisplayFetchedPosts = true
    owner = viewModel.owner
    posts = viewModel.posts
  }
}
