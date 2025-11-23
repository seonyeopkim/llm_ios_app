import ChatFeature
import ChatFeatureTesting
import LanguageModelClientTesting
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let mockTokens = ["안녕하세요! ", "도움이 ", "필요하시면 ", "언제든 ", "말씀해주세요."]
            let repository = MockLanguageModelClient(tokens: mockTokens)
            let useCase = MockChatFeatureUseCase(repository: repository)
            ChatFeatureView(useCase: useCase)
        }
    }
}
