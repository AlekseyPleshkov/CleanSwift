//
//  HomeViewController.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
  /// Отобразить результат загрузки списка пользователей в таблице
  func displayFetchedUsers(_ viewModel: HomeModels.FetchUsers.ViewModel)

  /// Отобразить выбор пользователя из списка
  func displaySelectedUser(_ viewModel: HomeModels.SelectUser.ViewModel)
}

final class HomeViewController: UIViewController {

  // MARK: - Public Properties

  private(set) var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

  // MARK: - Private Properties

  private var interactor: HomeBusinessLogic?
  private var users: [User] = []

  // MARK: - UI Outlets

  @IBOutlet private weak var tableUsers: UITableView!

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

  /// Отправляем запрос на загрузку постов в таблицу
  private func requestToFetchUsers() {
    let request = HomeModels.FetchUsers.Request()

    interactor?.fetchUsers(request)
  }

  /// Выбрать пользователя в таблице
  private func requestToSelectUser(index: Int) {
    let request = HomeModels.SelectUser.Request(index: index)

    interactor?.selectUser(request)
  }
}

// MARK: - Home Display Logic

extension HomeViewController: HomeDisplayLogic {

  func displayFetchedUsers(_ viewModel: HomeModels.FetchUsers.ViewModel) {
    if let fetchedUsers = viewModel.users {
      users = fetchedUsers
      tableUsers.reloadData()
    }
  }

  func displaySelectedUser(_ viewModel: HomeModels.SelectUser.ViewModel) {
    if viewModel.isSelected {
      router?.routeToPosts()
    }
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let user = users[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellUser", for: indexPath)

    if let cellLabel = cell.textLabel {
      cellLabel.text = user.username
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    requestToSelectUser(index: indexPath.row)
  }
}
