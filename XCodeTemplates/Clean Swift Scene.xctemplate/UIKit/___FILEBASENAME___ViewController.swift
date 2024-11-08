//___FILEHEADER___

import UIKit

protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject {

}

final class ___VARIABLE_sceneName___ViewController: UIViewController {
  
  // MARK: - Public Properties

  var interactor: ___VARIABLE_sceneName___BusinessLogic?
  var router: (___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?
  
  lazy var contentView: ___VARIABLE_sceneName___ViewLogic = ___VARIABLE_sceneName___View()

  // MARK: - Private Properties

  //

  // MARK: - Lifecycle

  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  private func configure() {
    
  }
  
  // MARK: - UI Actions
  
  //
}

// MARK: - Display Logic

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {

}
