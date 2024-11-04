//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_sceneName___View: View {
    // MARK: - Private Properties
    
    @State
    private var state: ___VARIABLE_sceneName___State
    private let interactor: ___VARIABLE_sceneName___BusinessLogic
    
    private let appearance = Appearance()
    
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
        .onAppear {
            
        }
    }
}

// MARK: - Appearance

private extension ___VARIABLE_sceneName___View {
    struct Appearance {
    }
}

// MARK: - PreviewProvider

struct ___VARIABLE_sceneName___View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ___VARIABLE_sceneName___Builder().makeScene(with: ___VARIABLE_sceneName___Builder.Context())
        }
    }
}
