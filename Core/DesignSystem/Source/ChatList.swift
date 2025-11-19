import Entities
import SwiftUI

public struct ChatList: View {
    @Binding private var dataSources: [Chat]
    
    public var body: some View {
        List(self.dataSources) { dataSource in
            ChatCell(
                prompt: dataSource.prompt,
                response: dataSource.response
            )
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    public init(_ dataSources: Binding<[Chat]>) {
        self._dataSources = dataSources
    }
}
