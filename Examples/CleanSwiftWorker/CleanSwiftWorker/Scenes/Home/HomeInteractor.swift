//
//  HomeInteractor.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
  /// Запрос на загрузку постов
  func fetchUsers(_ request: HomeModels.FetchUsers.Request)

  /// Выбрать пользователя из списка по индексу
  func selectUser(_ request: HomeModels.SelectUser.Request)
}

protocol HomeDataStore {
  var users: [User]? { get }
  var selectedUser: User? { get }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {

  // MARK: - Public

  var presenter: HomePresentationLogic?

  var users: [User]?
  var selectedUser: User?

  // MARK: - Private

  /// Ссылка на локальный Worker сцены
  private lazy var homeWorker = HomeWorker()

  // MARK: - HomeBusinessLogic

  func fetchUsers(_ request: HomeModels.FetchUsers.Request) {
    homeWorker.fetchUsers { [unowned self] users in
      let response = HomeModels.FetchUsers.Response(users: users)

      self.users = users
      self.presenter?.presentFetchedUsers(response)
    }
  }

  func selectUser(_ request: HomeModels.SelectUser.Request) {
    let user = users?[request.index]
    let response = HomeModels.SelectUser.Response(user: user)

    selectedUser = user
    presenter?.presentSelectedUser(response)
  }
}
