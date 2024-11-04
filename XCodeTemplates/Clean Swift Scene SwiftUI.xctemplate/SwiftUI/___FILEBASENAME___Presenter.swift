//___FILEHEADER___

@MainActor
protocol ___VARIABLE_sceneName___PresentationLogic: Sendable {
    
}

final class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    // MARK: - Private Properties
    
    private weak var state: ___VARIABLE_sceneName___DisplayLogic?
    
    // MARK: - Initializers
    
    init(state: ___VARIABLE_sceneName___DisplayLogic) {
        self.state = state
    }
    
    // MARK: - ___VARIABLE_sceneName___PresentationLogic
}
