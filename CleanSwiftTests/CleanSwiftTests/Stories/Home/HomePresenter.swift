//
//  HomePresenter.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomePresentationLogic {
  /// Подготовка для отображения списка загруженных пользователей
  func presentFetchedUsers(_ response: HomeModels.FetchUsers.Response)
}

final class HomePresenter: HomePresentationLogic {

  // MARK: - Public

  weak var viewController: HomeDisplayLogic?

  // MARK: - HomePresentationLogic

  func presentFetchedUsers(_ response: HomeModels.FetchUsers.Response) {
    // Для примера, сортируем пользователей по возрастанию ID
    let sortedUsers = response.users.sorted { (userFirst, userSecond) in
      return userFirst.id < userSecond.id
    }
    let viewModel = HomeModels.FetchUsers.ViewModel(users: sortedUsers)

    viewController?.displayFetchedUsers(viewModel)
  }
}
