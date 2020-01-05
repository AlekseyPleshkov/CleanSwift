//
//  HomeModels.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum HomeModels {

  // MARK: - Загрузка списка пользователей и отображение в таблице
  
  enum FetchUsers {
    struct Request {}

    struct Response {
      let users: [User]
    }

    struct ViewModel {
      let users: [User]
    }
  }

  // MARK: - Выбрать пользователя по индексу из списка
  
  enum SelectUser {
    struct Request {
      let index: Int
    }
  }
}
