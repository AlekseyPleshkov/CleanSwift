//___FILEHEADER___

import XCTest
@testable import ___PROJECTNAME___

final class ___VARIABLE_sceneName___PresenterTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: ___VARIABLE_sceneName___Presenter!
  private var viewController: ___VARIABLE_sceneName___DisplayLogicSpy!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let presenter = ___VARIABLE_sceneName___Presenter()
    let viewController = ___VARIABLE_sceneName___DisplayLogicSpy()
    
    presenter.viewController = viewController
    
    sut = presenter
    self.viewController = viewController
  }
  
  override func tearDown() {
    sut = nil
    viewController = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  //
}
