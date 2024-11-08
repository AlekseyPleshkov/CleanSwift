//
//  HomeViewController.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
  func displayFetchedUsers(_ viewModel: HomeModels.FetchUsers.ViewModel)
}

final class HomeViewController: UITableViewController {

  // MARK: - Public Properties

  var interactor: HomeBusinessLogic?
  var router: (HomeRoutingLogic & HomeDataPassing)?

  // MARK: - Private Properties

  private var users: [User] = []

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
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()

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

    requestToFetchUsers()
  }

  // MARK: - Requests

  private func requestToFetchUsers() {
    let request = HomeModels.FetchUsers.Request()
    interactor?.fetchUsers(request)
  }

  private func requestToSelectUser(by indexPath: IndexPath) {
    let request = HomeModels.SelectUser.Request(index: indexPath.row)
    interactor?.selectUser(request)
  }
}

// MARK: - Home Display Logic

extension HomeViewController: HomeDisplayLogic {

  func displayFetchedUsers(_ viewModel: HomeModels.FetchUsers.ViewModel) {
    users = viewModel.users
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension HomeViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let user = users[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellUser", for: indexPath)

    if let cellLabel = cell.textLabel {
      cellLabel.text = user.name
    }

    return cell
  }
}

// MARK: - UITableViewDelegate

extension HomeViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    requestToSelectUser(by: indexPath)
    router?.routeToPosts()
  }
}
