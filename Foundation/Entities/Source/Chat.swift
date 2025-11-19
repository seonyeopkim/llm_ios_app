import Foundation

public struct Chat: Identifiable {
    public let id = UUID()
    public let prompt: String
    public let response: String
    
    public init(prompt: String, response: String) {
        self.prompt = prompt
        self.response = response
    }
}
