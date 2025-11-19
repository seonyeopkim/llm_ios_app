import DesignSystem
import SwiftUI

struct RoundedTextFieldExampleView: View {
    var body: some View {
        RoundedTextField(
            .chatTextFieldTitle,
            text: .constant("")
        )
        .padding()
    }
}

#Preview {
    RoundedTextFieldExampleView()
}
