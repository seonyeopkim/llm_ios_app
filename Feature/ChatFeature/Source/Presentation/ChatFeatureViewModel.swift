import ChatFeatureInterface
import Combine
import Entities
import Foundation

@MainActor
public final class ChatFeatureViewModel: ObservableObject {
    @Published private(set) var dataSources = [Chat]()
    @Published private(set) var error = String()
    
    @Published var prompt = String()
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
        
        let id = UUID()
        self.dataSources.append(Chat(id: id, prompt: prompt))
        
        Task {
            do {
                for try await partial in self.useCase.streamResponse(to: prompt) {
                    let newChat = [Chat(id: id, prompt: prompt, response: partial)]
                    self.dataSources = self.dataSources.dropLast() + newChat
                }
            } catch {
                self.error = error.localizedDescription
                self.showError = true
            }
        }
    }
}
