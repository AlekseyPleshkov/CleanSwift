//
//  PostsWorker.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

struct PostsWorker {

  // MARK: - Private Properties

  private let networkWorker = NetworkWorker()
  private let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")

  // MARK: - Public Methods

  /// Запрос к API на загрузку списка постов пользователя
  ///
  /// - Parameters:
  ///   - userId: ID пользователя, посты которого нужно загрузить
  ///   - complete: Возвращает список загруженных постов
  func fetchPosts(userId: Int, _ complete: @escaping ([Post]?) -> Void) {
    guard let postsURL = postsURL else {
      complete(nil)
      return
    }

    let params = [
      "userId": String(userId)
    ]

    networkWorker.sendRequest(to: postsURL, params: params) { (data, error) in
      guard let data = data else {
        complete(nil)
        return
      }

      let decoder = JSONDecoder()
      let posts = try? decoder.decode([Post].self, from: data)

      complete(posts)
    }
  }
}
