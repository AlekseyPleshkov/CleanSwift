//
//  HomePresenter.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol HomePresentationLogic {
  func presentUpdateMessage(_ response: HomeModels.UpdateMessage.Response)
}

final class HomePresenter: HomePresentationLogic {

  // MARK: - Private

  // MARK: - Public

  weak var viewController: HomeDisplayLogic?

  // MARK: - HomePresentationLogic

  func presentUpdateMessage(_ response: HomeModels.UpdateMessage.Response) {
    let message = response.message ?? String()
    let isUpdated = !message.isEmpty && message.count > 4
    let viewModel = HomeModels.UpdateMessage.ViewModel(isUpdated: isUpdated)
    
    viewController?.displayUpdateMessage(viewModel)
  }
}
