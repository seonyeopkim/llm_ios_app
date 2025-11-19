import DesignSystem
import EntitiesTesting
import SwiftUI

public struct ChatFeatureView: View {
    public var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            ChatList(.constant(ChatMocks.default))
            RoundedTextField(
                .chatTextFieldTitle,
                text: .constant(""),
            )
            .padding()
            .focused(self.$isFocused)
        }
        .onTapGesture {
            self.isFocused = false
        }
    }
    
    @FocusState private var isFocused: Bool
    
    public init() {}
}

#Preview {
    ChatFeatureView()
}
