import DesignSystem
import EntitiesTesting
import SwiftUI

struct ChatListExampleView: View {
    var body: some View {
        VStack {
            Spacer()
            ChatList(ChatMocks.default)
        }
    }
}

#Preview {
    ChatListExampleView()
}
