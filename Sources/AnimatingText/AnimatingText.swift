import SwiftUI

public struct AnimatingText: View {
    // MARK: - Private Properties

    private let text: String
    private let interval: TimeInterval
    private let onFinished: () -> Void

    @StateObject private var viewModel = AnimatingTextModel()

    // MARK: - View

    public var body: some View {
        Text(viewModel.animatingText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                viewModel.animate(with: text, interval: interval, onFinished: onFinished)
            }
    }

    // MARK: - Initializer

    public init(
        text: String,
        interval: TimeInterval = 0.05,
        onFinished: @escaping () -> Void = {}
    ) {
        self.text = text
        self.interval = interval
        self.onFinished = onFinished
    }

    public init(
        _ text: String,
        interval: TimeInterval = 0.05,
        onFinished: @escaping () -> Void = {}
    ) {
        self.text = text
        self.interval = interval
        self.onFinished = onFinished
    }
}
