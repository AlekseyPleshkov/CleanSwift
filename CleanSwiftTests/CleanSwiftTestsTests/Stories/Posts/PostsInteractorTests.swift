//
//  PostsInteractorTests.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import XCTest
@testable import CleanSwiftTests

final class PostsInteractorTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: PostsInteractor!
  private var presenter: PostsPresentationLogicSpy!
  private var worker: PostsWorkingLogicSpy!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let postsInteractor = PostsInteractor()
    let postsPresenter = PostsPresentationLogicSpy()
    let postsWorker = PostsWorkingLogicSpy()
    
    postsInteractor.presenter = postsPresenter
    postsInteractor.worker = postsWorker
    
    sut = postsInteractor
    presenter = postsPresenter
    worker = postsWorker
  }
  
  override func tearDown() {
    super.tearDown()
    
    sut = nil
    presenter = nil
    worker = nil
  }
  
  // MARK: - Public Methods
  
  func testFetchPosts() {
    let request = PostsModels.FetchPosts.Request()
    let user = User(id: 1, name: "Ivan", username: "ivan91")
    
    sut.user = user
    sut.fetchPosts(request)
    
    XCTAssertTrue(presenter.isCalledPresentFetchedPosts, "Not started presenter.presentFetchedPosts(:)")
    XCTAssertTrue(worker.isCalledFetchPosts, "Not started worker.fetchPosts(:)")
  }
}
