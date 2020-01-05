//
//  DetailInteractor.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol DetailBusinessLogic {

  func showMessage(_ request: DetailModels.ShowMessage.Request)
}

protocol DetailDataStore {
  var message: String? { get set }
}

final class DetailInteractor: DetailBusinessLogic, DetailDataStore {

  // MARK: - Private

  // MARK: - Public

  var presenter: DetailPresentationLogic?
  var message: String?

  // MARK: - DetailBusinessLogic

  func showMessage(_ request: DetailModels.ShowMessage.Request) {
    let response = DetailModels.ShowMessage.Response(message: message)

    presenter?.presentMessage(response)
  }
}
