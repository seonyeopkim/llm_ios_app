import MarkdownUI
import SwiftUI

public struct ChatCell: View {
    public let prompt: String
    public let response: String
    
    public var body: some View {
        VStack(spacing: 50) {
            HStack {
                Spacer(minLength: 100)
                Text(self.prompt)
                    .padding()
                    .font(.system(size: 15, weight: .bold))
                    .background(DesignSystemAsset.defaultBackground.swiftUIColor)
                    .foregroundStyle(DesignSystemAsset.defaultText.swiftUIColor)
                    .cornerRadius(15)
            }
            Markdown(self.response)
        }
    }
    
    public init(prompt: String, response: String) {
        self.prompt = prompt
        self.response = response
    }
}
