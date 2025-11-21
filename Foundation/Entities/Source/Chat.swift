import Foundation

public struct Chat: Hashable, Identifiable, Sendable {
    public let id: UUID
    public let prompt: String
    public let response: String
    
    public init(id: UUID = UUID(), prompt: String, response: String = "") {
        self.id = id
        self.prompt = prompt
        self.response = response
    }
}
