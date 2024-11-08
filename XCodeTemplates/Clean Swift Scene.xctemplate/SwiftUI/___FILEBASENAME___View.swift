//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_sceneName___View: View {
    // MARK: - Private Properties
    
    @State
    private var state: ___VARIABLE_sceneName___State
    private let interactor: ___VARIABLE_sceneName___BusinessLogic

    // MARK: - Initializers
    
    init(
        state: ___VARIABLE_sceneName___State,
        interactor: ___VARIABLE_sceneName___BusinessLogic
    ) {
        self.state = state
        self.interactor = interactor
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
        }
        .task {
            await interactor.fetchData(___VARIABLE_sceneName___Flow.FetchData.Request())
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ___VARIABLE_sceneName___Builder().makeScene(with: ___VARIABLE_sceneName___Builder.Context())
    }
}