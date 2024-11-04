//___FILEHEADER___

protocol ___VARIABLE_sceneName___BusinessLogic: Sendable {
    
}

protocol ___VARIABLE_sceneName___DataStorable: Sendable {
    
}

final actor ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic, ___VARIABLE_sceneName___DataStorable {
    // MARK: - Private Properties
    
    private let presenter: ___VARIABLE_sceneName___PresentationLogic
    
    // MARK: - ___VARIABLE_sceneName___DataStorable
    
    //
    
    // MARK: - Initializers
    
    init(presenter: ___VARIABLE_sceneName___PresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - ___VARIABLE_sceneName___BusinessLogic
    
    //
}
