import Combine
import Foundation
import struct SwiftUI.Color

class AnimatingTextModel: ObservableObject {
    @Published private(set) var animatingText: AttributedString = ""
    private var cancellables = Set<AnyCancellable>()

    func animate(with text: String, textColor: Color, interval: TimeInterval, onFinished: @escaping () -> Void) {
        animatingText = .init(text)
        animatingText.foregroundColor = .clear

        let timerPublisher = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()

        let textPublisher = text.enumerated().publisher

        Publishers.Zip(timerPublisher, textPublisher)
            .map(\.1.offset)
            .sink { [unowned self] in
                let startIndex = text.startIndex
                let endIndex = text.index(text.startIndex, offsetBy: $0)
                let substring = text[startIndex ... endIndex]
                if let range = animatingText.range(of: substring) {
                    animatingText[range].foregroundColor = textColor
                }

                if endIndex == text.index(before: text.endIndex) {
                    onFinished()
                }
            }
            .store(in: &cancellables)
    }
}
