//___FILEHEADER___

import XCTest
@testable import ___PROJECTNAME___

final class ___VARIABLE_sceneName___InteractorTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: ___VARIABLE_sceneName___Interactor!
  private var worker: ___VARIABLE_sceneName___WorkingLogicSpy!
  private var presenter: ___VARIABLE_sceneName___PresentationLogicSpy!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let interactor = ___VARIABLE_sceneName___Interactor()
    let worker = ___VARIABLE_sceneName___WorkingLogicSpy()
    let presenter = ___VARIABLE_sceneName___PresentationLogicSpy()
    
    interactor.worker = worker
    interactor.presenter = presenter
    
    sut = interactor
    self.worker = worker
    self.presenter = presenter
  }
  
  override func tearDown() {
    sut = nil
    worker = nil
    presenter = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  //
}
