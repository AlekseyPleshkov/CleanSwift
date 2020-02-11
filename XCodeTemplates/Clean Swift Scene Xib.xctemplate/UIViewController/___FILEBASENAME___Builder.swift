//
//  DetailBuilder.swift
//  NewCleanSwift
//
//  Created by Aleksey Pleshkov on 10.02.2020.
//  Copyright © 2020 Aleksey Pleshkov. All rights reserved.
//

import UIKit

protocol ___VARIABLE_sceneName___BuildingLogic: class {
  func makeScene(parent: UIViewController?) -> ___VARIABLE_sceneName___ViewController
}

final class ___VARIABLE_sceneName___Builder: ___VARIABLE_sceneName___BuildingLogic {
  
  // MARK: - Public Methods
  
  func makeScene(parent: UIViewController? = nil) -> ___VARIABLE_sceneName___ViewController {
    let viewController = ___VARIABLE_sceneName___ViewController(nibName: "___VARIABLE_sceneName___", bundle: nil)
    
    let interactor = ___VARIABLE_sceneName___Interactor()
    let presenter = ___VARIABLE_sceneName___Presenter()
    let router = ___VARIABLE_sceneName___Router()

    interactor.presenter = presenter
    presenter.viewController = viewController
    
    router.parentController = parent
    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
    
    return viewController
  }
}
