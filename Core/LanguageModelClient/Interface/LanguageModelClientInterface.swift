public protocol LanguageModelClientInterface {
    func streamResponse(to prompt: String) -> sending AsyncThrowingStream<String, any Error>
}
