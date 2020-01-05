//
//  PostsPresenter.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol PostsPresentationLogic {
  /// Подготовка загруженного списка пользователей к отображению
  func presentFetchedPosts(_ response: PostsModels.FetchPosts.Response)
}

final class PostsPresenter: PostsPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: PostsDisplayLogic?

  // MARK: - Private Properties

  // MARK: - PostsPresentationLogic

  func presentFetchedPosts(_ response: PostsModels.FetchPosts.Response) {
    let sortedPosts = response.posts?.sorted { (firstPost, secondPost) in
      return firstPost.title.count < secondPost.title.count
    }
    let viewModel = PostsModels.FetchPosts.ViewModel(owner: response.owner, posts: sortedPosts)

    viewController?.displayFetchedPosts(viewModel)
  }
}
