public protocol ChatFeatureUseCaseInterface {
    func streamResponse(to prompt: String) -> sending AsyncThrowingStream<String, any Error>
}
