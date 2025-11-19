import SwiftUI

struct ExampleView: View {
    let examples: [Example] = [
        .ChatList,
        .RoundedTextField,
    ]
    
    var body: some View {
        NavigationStack {
            List(self.examples) { example in
                NavigationLink(example.rawValue, value: example)
            }
            .navigationDestination(for: Example.self) { example in
                switch example {
                case .ChatList: ChatListExampleView()
                case .RoundedTextField: RoundedTextFieldExampleView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Design System Examples")
        }
    }
}

extension ExampleView {
    enum Example: String, Identifiable {
        case ChatList
        case RoundedTextField

        var id: String {
            self.rawValue
        }
    }
}

#Preview {
    ExampleView()
}
