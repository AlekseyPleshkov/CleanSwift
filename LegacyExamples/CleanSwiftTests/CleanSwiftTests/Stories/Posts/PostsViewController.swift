//
//  PostsViewController.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 15/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol PostsDisplayLogic: class {
  func displayFetchedPosts(_ viewModel: PostsModels.FetchPosts.ViewModel)
}

final class PostsViewController: UITableViewController {

  // MARK: - Public Properties

  var interactor: PostsBusinessLogic?
  var router: (PostsRoutingLogic & PostsDataPassing)?

  // MARK: - Private Properties

  private var posts: [Post] = []

  // MARK: - Init

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup() {
    let interactor = PostsInteractor()
    let presenter = PostsPresenter()
    let router = PostsRouter()

    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.dataStore = interactor

    self.interactor = interactor
    self.router = router
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    requestToFetchPosts()
  }

  // MARK: - Requests

  private func requestToFetchPosts() {
    let request = PostsModels.FetchPosts.Request()
    interactor?.fetchPosts(request)
  }
}

// MARK: - Posts Display Logic

extension PostsViewController: PostsDisplayLogic {

  func displayFetchedPosts(_ viewModel: PostsModels.FetchPosts.ViewModel) {
    title = viewModel.owner.name
    posts = viewModel.posts
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension PostsViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let post = posts[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellPost", for: indexPath)

    if let cellLabel = cell.textLabel {
      cellLabel.text = post.title
    }

    if let cellDetailLabel = cell.detailTextLabel {
      cellDetailLabel.text = post.body
    }

    return cell
  }
}
