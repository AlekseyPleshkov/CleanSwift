//
//  HomeInteractor.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
  func updateMessage(_ request: HomeModels.UpdateMessage.Request)
}

protocol HomeDataStore {
  var message: String? { get }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {

  // MARK: - Private

  // MARK: - Public

  var presenter: HomePresentationLogic?
  var message: String?

  // MARK: - HomeBusinessLogic

  func updateMessage(_ request: HomeModels.UpdateMessage.Request) {
    let response = HomeModels.UpdateMessage.Response(message: request.message)

    // Сохраняем присланное сообщение в Data Store
    message = request.message
    
    presenter?.presentUpdateMessage(response)
  }
}
