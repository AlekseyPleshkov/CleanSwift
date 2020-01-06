//
//  PostsPresenter.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol PostsPresentationLogic {
  func presentFetchedPosts(_ response: PostsModels.FetchPosts.Response)
}

final class PostsPresenter: PostsPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: PostsDisplayLogic?

  // MARK: - PostsPresentationLogic

  func presentFetchedPosts(_ response: PostsModels.FetchPosts.Response) {
    let sortedPosts = response.posts.sorted { $0.title.count < $1.title.count }
    let viewModel = PostsModels.FetchPosts.ViewModel(owner: response.owner, posts: sortedPosts)

    viewController?.displayFetchedPosts(viewModel)
  }
}
