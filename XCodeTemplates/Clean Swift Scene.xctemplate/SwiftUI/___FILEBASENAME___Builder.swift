//___FILEHEADER___

@MainActor
protocol ___VARIABLE_sceneName___BuildingLogic: AnyObject, Sendable {
    associatedtype Context
    func makeScene(with context: Context) -> ___VARIABLE_sceneName___View
}

final class ___VARIABLE_sceneName___Builder: ___VARIABLE_sceneName___BuildingLogic {
    struct Context: Equatable {}
    
    func makeScene(with context: Context) -> ___VARIABLE_sceneName___View {
        let state = ___VARIABLE_sceneName___State()
        let presenter = ___VARIABLE_sceneName___Presenter(state: state)
        let interactor = ___VARIABLE_sceneName___Interactor(presenter: presenter)
        
        return ___VARIABLE_sceneName___View(state: state, interactor: interactor)
    }
}
