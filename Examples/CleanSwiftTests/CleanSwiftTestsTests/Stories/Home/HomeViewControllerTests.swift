//
//  HomeViewControllerTests.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 29.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import XCTest
@testable import CleanSwiftTests

final class HomeViewControllerTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: HomeViewController!
  private var interactor: HomeBusinessLogicSpy!
  private var window: UIWindow!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let mainWindow = UIWindow()
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Home", bundle: bundle)
    
    let homeViewController = storyboard.instantiateViewController(
      identifier: "HomeViewController") as? HomeViewController
    let homeInteractor = HomeBusinessLogicSpy()
    
    homeViewController?.interactor = homeInteractor
    
    sut = homeViewController
    interactor = homeInteractor
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
    
    XCTAssert(interactor.isCalledFetchUsers, "Not started interactor.fetchUsers(:)")
  }
  
  func testDisplayFetchedUsers() {
    let tableViewSpy = TableViewSpy()
    let users = [
      User(id: 1, name: "Ivan", username: "ivan"),
      User(id: 2, name: "Vasya", username: "vasya91"),
      User(id: 3, name: "Maria", username: "maria_love")
    ]
    let viewModel = HomeModels.FetchUsers.ViewModel(users: users)
    
    sut.tableView = tableViewSpy
    sut.displayFetchedUsers(viewModel)
    
    XCTAssertTrue(tableViewSpy.isCalledReloadData, "Not started tableView.reloadData")
    XCTAssertEqual(tableViewSpy.numberOfRows(inSection: 0), users.count)
  }
}
