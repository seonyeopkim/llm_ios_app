import ChatFeatureInterface
import LanguageModelClientInterface

public struct ChatFeatureUseCase {
    private let repository: LanguageModelClientInterface
    
    public init(repository: LanguageModelClientInterface) {
        self.repository = repository
    }
}

extension ChatFeatureUseCase: ChatFeatureUseCaseInterface {
    public func streamResponse(to prompt: String) -> sending AsyncThrowingStream<String, any Error> {
        self.repository.streamResponse(to: prompt)
    }
}
