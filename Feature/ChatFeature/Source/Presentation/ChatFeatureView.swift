import DesignSystem
import EntitiesTesting
import SwiftUI

public struct ChatFeatureView: View {
    public var body: some View {
        VStack {
            Spacer()
            ChatList(.constant(ChatMocks.default))
        }
    }
    
    public init() {}
}

#Preview {
    ChatFeatureView()
}
