import ChatFeature
import LanguageModelClient
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = LanguageModelClient()
            let useCase = ChatFeatureUseCase(repository: repository)
            ChatFeatureView(useCase: useCase)
        }
    }
}
