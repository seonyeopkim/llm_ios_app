@testable import ChatFeature
import ChatFeatureTesting
import Combine
import Entities
import LanguageModelClientTesting
import Testing

@Suite("ChatFeatureViewModel")
@MainActor
final class ChatFeatureViewModelTests {
    private var cancellables = Set<AnyCancellable>()
    
    @Test("초기 상태 테스트")
    func testInitialState() {
        // Given
        let mockClient = MockLanguageModelClient()
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        
        // When
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        
        // Then
        #expect(viewModel.dataSource.isEmpty)
        #expect(viewModel.prompt.isEmpty)
        #expect(viewModel.error == nil)
        #expect(viewModel.showError == false)
    }
    
    @Test("빈 프롬프트인 경우 sendPrompt 호출 테스트")
    func testSendEmptyPrompt() {
        // Given
        let mockClient = MockLanguageModelClient()
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        
        // When
        viewModel.prompt = ""
        viewModel.sendPrompt()
        
        // Then
        #expect(viewModel.dataSource.isEmpty)
        #expect(viewModel.prompt.isEmpty)
        #expect(viewModel.error == nil)
        #expect(viewModel.showError == false)
    }
    
    @Test("빈 프롬프트가 아닌 경우 sendPrompt 호출 테스트")
    func testSendPrompt() async throws {
        // Given
        let mockTokens = ["안녕하세요! ", "도움이 ", "필요하시면 ", "언제든 ", "말씀해주세요."]
        let mockClient = MockLanguageModelClient(
            tokens: mockTokens,
            delayBetweenTokens: 0.01,
        )
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        let prompt = "프롬프트"
        
        var receivedResponses = [Chat]()
        viewModel.$dataSource
            .dropFirst(1)
            .compactMap { $0.last }
            .sink { receivedResponses.append($0) }
            .store(in: &self.cancellables)
        
        // When
        viewModel.prompt = prompt
        viewModel.sendPrompt()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        let id = try #require(viewModel.dataSource.last?.id)
        let expectedResponses = ([""] + mockTokens)
            .toLanguageModelResponses()
            .map { Chat(id: id, prompt: prompt, response: $0) }
        #expect(receivedResponses == expectedResponses)
        #expect(viewModel.prompt.isEmpty)
        #expect(viewModel.error == nil)
        #expect(viewModel.showError == false)
    }
    
    @Test("sendPrompt 호출시 에러 전파 테스트")
    func testSendPromptWithError() async throws {
        // Given
        let mockClient = MockLanguageModelClient(shouldThrowError: true)
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        let prompt = "프롬프트"
        
        // When
        viewModel.prompt = prompt
        viewModel.sendPrompt()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        let id = try #require(viewModel.dataSource.last?.id)
        #expect(viewModel.dataSource == [Chat(id: id, prompt: prompt)])
        #expect(viewModel.prompt.isEmpty)
        let receivedError = viewModel.error as? MockLanguageModelError
        #expect(receivedError == MockLanguageModelError.simulatedError)
        #expect(viewModel.showError == true)
    }
    
    @Test("이전 대화가 존재하는 경우 sendPrompt 호출 테스트")
    func testSendPromptWhenChatExists() async throws {
        // Given
        let mockTokens = ["안녕하세요! ", "도움이 ", "필요하시면 ", "언제든 ", "말씀해주세요."]
        let mockClient = MockLanguageModelClient(
            tokens: mockTokens,
            delayBetweenTokens: 0.01,
        )
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        let prompt = "프롬프트"
        
        var receivedResponses = [Chat]()
        viewModel.$dataSource
            .dropFirst(2)
            .compactMap { $0.last }
            .sink { receivedResponses.append($0) }
            .store(in: &self.cancellables)
        
        // When
        viewModel.dataSource = [Chat(prompt: prompt, response: "응답")]
        viewModel.prompt = prompt
        viewModel.sendPrompt()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        let id = try #require(viewModel.dataSource.last?.id)
        let expectedResponses = ([""] + mockTokens)
            .toLanguageModelResponses()
            .map { Chat(id: id, prompt: prompt, response: $0) }
        #expect(receivedResponses == expectedResponses)
        #expect(viewModel.prompt.isEmpty)
        #expect(viewModel.error == nil)
        #expect(viewModel.showError == false)
    }
    
    @Test("sendPrompt 호출시 prompt 초기화 테스트")
    func testPromptInitialization() {
        // Given
        let mockClient = MockLanguageModelClient()
        let mockUseCase = MockChatFeatureUseCase(repository: mockClient)
        let viewModel = ChatFeatureViewModel(useCase: mockUseCase)
        let prompt = "프롬프트"
        
        // When
        viewModel.prompt = prompt
        viewModel.sendPrompt()
        
        // Then
        #expect(viewModel.prompt.isEmpty)
    }
}
