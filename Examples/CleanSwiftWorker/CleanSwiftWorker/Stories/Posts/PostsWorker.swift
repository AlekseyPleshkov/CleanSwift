//
//  PostsWorker.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol PostsWorkingLogic {
  /// Request to API for loading list of user posts
  func fetchPosts(userId: Int, _ complete: @escaping ([Post]?) -> Void)
}

final class PostsWorker: PostsWorkingLogic {

  // MARK: - Private Properties

  private let networkWorker = NetworkWorker()
  private let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")

  // MARK: - PostsWorkingLogic

  func fetchPosts(userId: Int, _ completion: @escaping ([Post]?) -> Void) {
    guard let postsURL = postsURL else {
      completion(nil)
      return
    }

    let params = ["userId": String(userId)]

    networkWorker.sendRequest(to: postsURL, params: params) { (data, error) in
      guard let data = data else {
        completion(nil)
        return
      }

      let decoder = JSONDecoder()
      let posts = try? decoder.decode([Post].self, from: data)

      completion(posts)
    }
  }
}
