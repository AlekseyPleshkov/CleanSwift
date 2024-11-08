//
//  HomePresenterTests.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 29.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import XCTest
@testable import CleanSwiftTests

final class HomePresenterTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: HomePresenter!
  private var viewController: HomeDisplayLogicSpy!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let homePresenter = HomePresenter()
    let homeViewController = HomeDisplayLogicSpy()
    
    homePresenter.viewController = homeViewController
    
    sut = homePresenter
    viewController = homeViewController
  }
  
  override func tearDown() {
    sut = nil
    viewController = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  func testPresentFetchedUsers() {
    let expectationFistId = 1
    let expectationLastId = 3
    let users = [
      User(id: 2, name: "Vasya", username: "vasya91"),
      User(id: 1, name: "Ivan", username: "ivan"),
      User(id: 3, name: "Maria", username: "maria_love")
    ]
    let response = HomeModels.FetchUsers.Response(users: users)
    
    sut.presentFetchedUsers(response)
    
    XCTAssertTrue(viewController.isCalledDisplayFetchedUsers, "Not started viewController.displayFetchedUsers(:)")
    XCTAssertEqual(viewController.users.first?.id, expectationFistId)
    XCTAssertEqual(viewController.users.last?.id, expectationLastId)
  }
}
