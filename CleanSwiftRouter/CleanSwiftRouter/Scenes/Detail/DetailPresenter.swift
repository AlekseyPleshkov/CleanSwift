//
//  DetailPresenter.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol DetailPresentationLogic {

  func presentMessage(_ response: DetailModels.ShowMessage.Response)
}

final class DetailPresenter: DetailPresentationLogic {

  // MARK: - Private

  // MARK: - Public

  weak var viewController: DetailDisplayLogic?

  // MARK: - DetailPresentationLogic

  func presentMessage(_ response: DetailModels.ShowMessage.Response) {
    let viewModel = DetailModels.ShowMessage.ViewModel(message: response.message)

    viewController?.displayMessage(viewModel)
  }
}
