//
//  PostsModels.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum PostsModels {

  // MARK: - Загружаем посты пользователя
  
  enum FetchPosts {
    struct Request {}

    struct Response {
      let owner: User
      let posts: [Post]
    }

    struct ViewModel {
      let owner: User
      let posts: [Post]
    }
  }
}
