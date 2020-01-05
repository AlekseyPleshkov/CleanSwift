//
//  PostsPresenterTests.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import XCTest
@testable import CleanSwiftTests

final class PostsPresenterTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: PostsPresenter!
  private var viewController: PostsDisplayLogicSpy!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let postsPresenter = PostsPresenter()
    let postsViewController = PostsDisplayLogicSpy()
    
    postsPresenter.viewController = postsViewController
    
    sut = postsPresenter
    viewController = postsViewController
  }
  
  override func tearDown() {
    sut = nil
    viewController = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  func testPresentFetchedPosts() {
    let expectationFirstId = 1
    let expectationLastId = 3
    let user = User(id: 1, name: "Ivan", username: "ivan91")
    let posts = [
      Post(userId: user.id, id: 3, title: "XXXL", body: "Hello World"),
      Post(userId: user.id, id: 1, title: "XL", body: "Hello World"),
      Post(userId: user.id, id: 2, title: "XXL", body: "Hello World")
    ]
    let response = PostsModels.FetchPosts.Response(owner: user, posts: posts)
    
    sut.presentFetchedPosts(response)
    
    XCTAssertTrue(viewController.isCalledDisplayFetchedPosts, "Not started viewController.displayFetchedPosts(:)")
    XCTAssertEqual(viewController.posts.first?.id, expectationFirstId)
    XCTAssertEqual(viewController.posts.last?.id, expectationLastId)
  }
}
