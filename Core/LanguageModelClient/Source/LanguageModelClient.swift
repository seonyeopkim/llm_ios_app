import FoundationModels
import LanguageModelClientInterface

public struct LanguageModelClient {
    private let session: LanguageModelSession
    
    public init() {
        self.session = LanguageModelSession()
    }
}

extension LanguageModelClient: LanguageModelClientInterface {
    public func streamResponse(to prompt: String) -> sending AsyncThrowingStream<String, any Error> {
        AsyncThrowingStream { continuation in
            let stream = self.session.streamResponse(to: prompt, options: .init())
            Task {
                do {
                    for try await partial in stream {
                        continuation.yield(partial.content)
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }
}
