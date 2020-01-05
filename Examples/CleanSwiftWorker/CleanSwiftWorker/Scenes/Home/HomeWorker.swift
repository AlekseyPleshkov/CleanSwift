//
//  HomeWorker.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

struct HomeWorker {

  // MARK: - Private Properties

  private let networkWorker = NetworkWorker()
  private let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")

  // MARK: - Public Methods

  /// Локальный Worker. Запрос к API на загрузку списка пользователей
  ///
  /// - Parameter complete: Возвращает загруженный список пользователей
  func fetchUsers(_ complete: @escaping ([User]?) -> Void) {
    guard let usersURL = usersURL else {
      complete(nil)
      return
    }

    networkWorker.sendRequest(to: usersURL, params: [:]) { (data, error) in
      guard let data = data else {
        complete(nil)
        return
      }

      let decoder = JSONDecoder()
      let users = try? decoder.decode([User].self, from: data)

      complete(users)
    }
  }
}
