//
//  PostsViewControllerTests.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 03.11.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import XCTest
@testable import CleanSwiftTests

final class PostsViewControllerTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: PostsViewController!
  private var interactor: PostsBusinessLogicSpy!
  private var window: UIWindow!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let mainWindow = UIWindow()
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Posts", bundle: bundle)
    
    let postsViewController = storyboard.instantiateViewController(identifier: "PostsViewController") as? PostsViewController
    let postsInteractor = PostsBusinessLogicSpy()
    
    postsViewController?.interactor = postsInteractor
    
    sut = postsViewController
    interactor = postsInteractor
    window = mainWindow
    
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  override func tearDown() {
    sut = nil
    interactor = nil
    window = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  func testViewDidLoad() {
    sut.viewWillAppear(true)
    
    XCTAssertTrue(interactor.isCalledFetchPosts, "Not started interactor.fetchPosts(:)")
  }
  
  func testDisplayFetchedPosts() {
    let tableViewSpy = TableViewSpy()
    let user = User(id: 1, name: "Ivan", username: "ivan91")
    let posts = [
      Post(userId: user.id, id: 3, title: "XXXL", body: "Hello World"),
      Post(userId: user.id, id: 1, title: "XL", body: "Hello World"),
      Post(userId: user.id, id: 2, title: "XXL", body: "Hello World")
    ]
    let viewModel = PostsModels.FetchPosts.ViewModel(owner: user, posts: posts)
    
    sut.tableView = tableViewSpy
    sut.displayFetchedPosts(viewModel)
    
    XCTAssertTrue(tableViewSpy.isCalledReloadData, "Not started viewController.tableView.reloadData()")
    XCTAssertEqual(tableViewSpy.numberOfRows(inSection: 0), posts.count)
  }
}
