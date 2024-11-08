//___FILEHEADER___

protocol ___VARIABLE_sceneName___BusinessLogic: Sendable {
    func fetchData(_ request: ___VARIABLE_sceneName___Flow.FetchData.Request) async
}

protocol ___VARIABLE_sceneName___DataStorable: Sendable, Actor {
    
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
    
    func fetchData(_ request: ___VARIABLE_sceneName___Flow.FetchData.Request) async {
        await presenter.presentFetchedData(___VARIABLE_sceneName___Flow.FetchData.Response())
    }
}
