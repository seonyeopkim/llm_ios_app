import ChatFeatureInterface
import LanguageModelClientInterface

public struct MockChatFeatureUseCase {
    private let repository: LanguageModelClientInterface
    
    public init(repository: LanguageModelClientInterface) {
        self.repository = repository
    }
}

extension MockChatFeatureUseCase: ChatFeatureUseCaseInterface {
    public func streamResponse(to prompt: String) -> sending AsyncThrowingStream<String, any Error> {
        self.repository.streamResponse(to: prompt)
    }
}
