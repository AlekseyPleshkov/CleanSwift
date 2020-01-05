//
//  HomeModels.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum HomeModels {

  /// Загрузка списка пользователей и отображение в таблице
  enum FetchUsers {
    struct Request {}

    struct Response {
      let users: [User]?
    }

    struct ViewModel {
      let users: [User]?
    }
  }

  /// Выбрать пользователя по индексу из списка
  enum SelectUser {
    struct Request {
      let index: Int
    }

    struct Response {
      let user: User?
    }

    struct ViewModel {
      let isSelected: Bool
    }
  }
}
