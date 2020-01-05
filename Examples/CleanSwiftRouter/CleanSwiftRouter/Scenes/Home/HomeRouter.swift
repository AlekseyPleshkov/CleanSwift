//
//  HomeRouter.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

/// Почемен как @objc для создания селектора
/// в методе prepare во View Controller'e
@objc protocol HomeRoutingLogic {
  /// Переход на Detail View Controller
  func routeToDetail(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
  var dataStore: HomeDataStore? { get }
}

final class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

  // MARK: - Private

  // MARK: - Public

  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

  // MARK: - HomeRoutingLogic

  func routeToDetail(segue: UIStoryboardSegue?) {
    if let segue = segue {
      // Данный участок кода срабатывает
      // только при переходе по Segue

      // Получаем ссылку на Detail View Controller
      // И на его Data Store в Router'e
      guard
        let homeDS = dataStore,
        let detailVC = segue.destination as? DetailViewController,
        var detailDS = detailVC.router?.dataStore
        else { fatalError("Fail route to detail") }

      // Далее, полученные данные, мы пробрасываем в метод,
      // который "знает" как передавать данные
      passDataToDetail(source: homeDS, destination: &detailDS)
    } else {
      // Данный участок кода срабатывает,
      // когда вызывается переход без Segue

      // Иницилизируем Detail View Controller из Storyboard'a
      // И получаем ссылку на его Data Store в Router'e
      guard
        let viewController = viewController,
        let homeDS = dataStore,
        let storyboard = viewController.storyboard,
        let detailVC = storyboard.instantiateViewController(withIdentifier: "Detail") as? DetailViewController,
        var detailDS = detailVC.router?.dataStore
        else { fatalError("Fail route to detail") }

      passDataToDetail(source: homeDS, destination: &detailDS)

      // Метод, который отвечает за переход и "знает" как это делать
      navigateToDetail(source: viewController, destination: detailVC)
    }
  }

  // MARK: - Navigation

  private func navigateToDetail(source: HomeViewController, destination: DetailViewController) {
    source.navigationController?.pushViewController(destination, animated: true)
  }

  // MARK: - Passing data

  /// Параметр destination помечен как inout,
  /// что бы избежать мутации Data Store и захвата ссылки при передаче данных
  private func passDataToDetail(source: HomeDataStore, destination: inout DetailDataStore) {

    // Передаем текст сообщения из HomeDataStore в DetailDataStore
    destination.message = source.message
  }
}
