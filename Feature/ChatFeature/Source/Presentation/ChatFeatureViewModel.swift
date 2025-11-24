import ChatFeatureInterface
import Combine
import Entities

@MainActor
public final class ChatFeatureViewModel: ObservableObject {
    @Published var dataSource = [Chat]()
    @Published var prompt = String()
    @Published var error: Error?
    @Published var showError: Bool = false
    
    private let useCase: ChatFeatureUseCaseInterface
    
    public init(useCase: ChatFeatureUseCaseInterface) {
        self.useCase = useCase
    }
    
    public func sendPrompt() {
        guard !self.prompt.isEmpty else {
            return
        }
        
        let prompt = self.prompt
        self.prompt = ""
        
        let newChat = Chat(prompt: prompt)
        self.dataSource.append(newChat)
        
        Task {
            do {
                for try await partial in self.useCase.streamResponse(to: prompt) {
                    let currentChat = [Chat(id: newChat.id, prompt: prompt, response: partial)]
                    self.dataSource = self.dataSource.dropLast() + currentChat
                }
            } catch {
                self.error = error
                self.showError = true
            }
        }
    }
}
