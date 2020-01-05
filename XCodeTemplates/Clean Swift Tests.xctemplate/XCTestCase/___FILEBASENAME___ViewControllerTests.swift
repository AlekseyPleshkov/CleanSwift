//___FILEHEADER___

import XCTest
@testable import ___PROJECTNAME___

final class ___VARIABLE_sceneName___ViewControllerTests: XCTestCase {
  
  // MARK: - Private Properties
  
  private var sut: ___VARIABLE_sceneName___ViewController!
  private var interactor: ___VARIABLE_sceneName___BusinessLogicSpy!
  private var window: UIWindow!
  
  // MARK: - Lifecycle
  
  override func setUp() {
    super.setUp()
    
    let mainWindow = UIWindow()
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "___VARIABLE_sceneName___", bundle: bundle)
    
    let viewController = storyboard.instantiateViewController(
      identifier: "___VARIABLE_sceneName___ViewController") as? ___VARIABLE_sceneName___ViewController
    let interactor = ___VARIABLE_sceneName___BusinessLogicSpy()
    
    viewController?.interactor = interactor
    
    sut = viewController
    window = mainWindow
    self.interactor = interactor
    
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  override func tearDown() {
    sut = nil
    interactor = nil
    window = nil
    
    super.tearDown()
  }
  
  // MARK: - Public Methods
  
  //
}
