//___FILEHEADER___

@MainActor
protocol ___VARIABLE_sceneName___PresentationLogic: Sendable {
    func presentFetchedData(_ response: ___VARIABLE_sceneName___Flow.FetchData.Response)
}

final class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    // MARK: - Private Properties
    
    private let state: ___VARIABLE_sceneName___State
    
    // MARK: - Initializers
    
    init(state: ___VARIABLE_sceneName___State) {
        self.state = state
    }
    
    // MARK: - ___VARIABLE_sceneName___PresentationLogic

    func presentFetchedData(_ response: ___VARIABLE_sceneName___Flow.FetchData.Response) {
        state.isLoaded = true
    }
}
