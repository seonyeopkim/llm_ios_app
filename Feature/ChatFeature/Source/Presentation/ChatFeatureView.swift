import ChatFeatureInterface
import DesignSystem
import SwiftUI

public struct ChatFeatureView: View {
    public var body: some View {
        VStack(spacing: .zero) {
            Spacer()
            ChatList(self.viewModel.dataSource)
            RoundedTextField(.chatTextFieldTitle, text: self.$viewModel.prompt)
                .onSubmit {
                    self.viewModel.sendPrompt()
                }
                .focused(self.$isFocused)
                .padding()
        }
        .alert("", isPresented: self.$viewModel.showError) {} message: {
            Text(self.viewModel.error?.localizedDescription ?? "")
        }
        .onTapGesture {
            self.isFocused = false
        }
    }
    
    @StateObject private var viewModel: ChatFeatureViewModel
    @FocusState private var isFocused: Bool
    
    public init(useCase: ChatFeatureUseCaseInterface) {
        let viewModel = ChatFeatureViewModel(useCase: useCase)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}
