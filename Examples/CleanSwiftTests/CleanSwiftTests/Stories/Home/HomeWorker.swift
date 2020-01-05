//
//  HomeWorker.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomeWorkingLogic {
  /// Запрос к API на загрузку списка пользователей
  func fetchUsers(_ completion: @escaping ([User]?) -> Void)
}

final class HomeWorker: HomeWorkingLogic {

  // MARK: - Private Properties

  private let networkWorker: NetworkWorkingLogic = NetworkWorker()
  private let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")

  // MARK: - HomeWorkingLogic

  func fetchUsers(_ completion: @escaping ([User]?) -> Void) {
    guard let usersURL = usersURL else {
      completion(nil)
      return
    }

    networkWorker.sendRequest(to: usersURL, params: [:]) { (data, error) in
      guard let data = data else {
        completion(nil)
        return
      }

      let decoder = JSONDecoder()
      let users = try? decoder.decode([User].self, from: data)

      completion(users)
    }
  }
}
