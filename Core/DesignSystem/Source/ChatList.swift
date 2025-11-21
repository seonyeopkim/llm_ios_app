import Entities
import SwiftUI

public struct ChatList: View {
    private let dataSources: [Chat]
    
    public var body: some View {
        List(self.dataSources) { dataSource in
            ChatCell(
                prompt: dataSource.prompt,
                response: dataSource.response,
            )
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    public init(_ dataSources: [Chat]) {
        self.dataSources = dataSources
    }
}
