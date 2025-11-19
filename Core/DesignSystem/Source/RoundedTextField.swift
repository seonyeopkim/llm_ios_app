import SwiftUI

public struct RoundedTextField: View {
    public var body: some View {
        TextField(
            self.title,
            text: self.$text,
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(DesignSystemAsset.defaultBackground.swiftUIColor)
        .clipShape(Capsule())
    }
    
    private let title: String
    @Binding private var text: String
    
    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
}
