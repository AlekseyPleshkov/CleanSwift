//
//  HomeModels.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum HomeModels {

  // MARK: - Fetch list of user and display in table
  
  enum FetchUsers {
    struct Request {}

    struct Response {
      let users: [User]
    }

    struct ViewModel {
      let users: [User]
    }
  }

  // MARK: - Select user by index
  
  enum SelectUser {
    struct Request {
      let index: Int
    }
  }
}
