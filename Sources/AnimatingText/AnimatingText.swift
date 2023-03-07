import SwiftUI

public struct AnimatingText: View {
    // MARK: - Private Properties

    private let text: String
    private let textColor: Color
    private let interval: TimeInterval
    private let onFinished: () -> Void

    @StateObject private var viewModel = AnimatingTextModel()

    // MARK: - View

    public var body: some View {
        ZStack {
            // For layout purposes only so that the container is properly sized from the beginning.
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .hidden()

            Text(viewModel.animatingText)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onAppear {
            viewModel.animate(with: text, textColor: textColor, interval: interval, onFinished: onFinished)
        }
    }

    // MARK: - Initializer

    public init(
        text: String,
        textColor: Color = .primary,
        interval: TimeInterval = 0.05,
        onFinished: @escaping () -> Void = {}
    ) {
        self.text = text
        self.textColor = textColor
        self.interval = interval
        self.onFinished = onFinished
    }

    public init(
        _ text: String,
        textColor: Color = .primary,
        interval: TimeInterval = 0.05,
        onFinished: @escaping () -> Void = {}
    ) {
        self.text = text
        self.textColor = textColor
        self.interval = interval
        self.onFinished = onFinished
    }
}
