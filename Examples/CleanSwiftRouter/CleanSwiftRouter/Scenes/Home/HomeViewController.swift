//
//  HomeViewController.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
  /// Обновление текста сообщения
  func displayUpdateMessage(_ viewModel: HomeModels.UpdateMessage.ViewModel)
}

final class HomeViewController: UIViewController {

  // MARK: - Private

  private var interactor: HomeBusinessLogic?

  // MARK: - Public

  private(set) var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

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

    // Присваиваем в Router ссылки на View Controller
    // и Data Store, под который подписан Interactor
    router.viewController = self
    router.dataStore = interactor

    self.interactor = interactor
    self.router = router
  }

  // MARK: - UI

  @IBOutlet weak var buttonShowDetailWithSegue: UIButton!
  @IBOutlet weak var buttonShowDetailWithoutSegue: UIButton!

  /// Отлавливаем событие изменения текста в Text Field
  @IBAction func fieldMessageDidChange(_ sender: UITextField) {
    updateMessage(message: sender.text)
  }

  /// Переход на Detail View Controller без Segue
  @IBAction func buttonShowDetailWithoutSegue(_ sender: Any) {
    router?.routeToDetail(segue: nil)
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  private func configure() {

  }

  // MARK: - Routing

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Если у Segue есть идентификатор
    if let scene = segue.identifier {

      // Создаем селектор, для вызова метода с этим именем и параметрами в Router
      // router?.routeToNAME(segue:)
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")

      // Если есть метод с таким селектором,
      // вызываем его и передаем в него Segue
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }

  // MARK: - Requests

  /// Метод для создания запроса в Interactor с текстом сообщения
  private func updateMessage(message: String?) {
    let request = HomeModels.UpdateMessage.Request(message: message)

    interactor?.updateMessage(request)
  }

  // MARK: - Main
}

// MARK: - Home Display Logic

extension HomeViewController: HomeDisplayLogic {

  func displayUpdateMessage(_ viewModel: HomeModels.UpdateMessage.ViewModel) {

    // Обновляем доступность кнопок
    // в зависимости от успешности обновления сообщения
    buttonShowDetailWithSegue.isEnabled = viewModel.isUpdated
    buttonShowDetailWithoutSegue.isEnabled = viewModel.isUpdated
  }
}
