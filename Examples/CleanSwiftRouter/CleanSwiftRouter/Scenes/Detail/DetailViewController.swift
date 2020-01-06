//
//  DetailViewController.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {

  func displayMessage(_ viewModel: DetailModels.ShowMessage.ViewModel)
}

final class DetailViewController: UIViewController {

  // MARK: - Private

  private var interactor: DetailBusinessLogic?

  // MARK: - Public

  private(set) var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?

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
    let interactor = DetailInteractor()
    let presenter = DetailPresenter()
    let router = DetailRouter()

    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.dataStore = interactor

    self.interactor = interactor
    self.router = router
  }

  // MARK: - UI
  
  @IBOutlet weak var labelMessage: UILabel!

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    showMessage()
  }

  private func configure() {

  }

  // MARK: - Routing

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")

      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }

  // MARK: - Requests

  private func showMessage() {
    let request = DetailModels.ShowMessage.Request()

    interactor?.showMessage(request)
  }

  // MARK: - Main
}

// MARK: - Detail Display Logic

extension DetailViewController: DetailDisplayLogic {

  func displayMessage(_ viewModel: DetailModels.ShowMessage.ViewModel) {
    labelMessage.text = viewModel.message
  }
}
