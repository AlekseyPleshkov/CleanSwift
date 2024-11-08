//
//  HomeInteractor.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
  func fetchUsers(_ request: HomeModels.FetchUsers.Request)
  func selectUser(_ request: HomeModels.SelectUser.Request)
}

protocol HomeDataStore {
  var users: [User] { get }
  var selectedUser: User? { get }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {

  // MARK: - Public Properties

  var presenter: HomePresentationLogic?
  lazy var worker: HomeWorkingLogic = HomeWorker()

  var users: [User] = []
  var selectedUser: User?

  // MARK: - HomeBusinessLogic

  func fetchUsers(_ request: HomeModels.FetchUsers.Request) {
    worker.fetchUsers { users in
      let users = users ?? []
      let response = HomeModels.FetchUsers.Response(users: users)

      self.users = users
      self.presenter?.presentFetchedUsers(response)
    }
  }

  func selectUser(_ request: HomeModels.SelectUser.Request) {
    guard !users.isEmpty, request.index < users.count else {
      return
    }
    
    selectedUser = users[request.index]
  }
}
