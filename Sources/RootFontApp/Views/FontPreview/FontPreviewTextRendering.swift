import Foundation

enum FontPreviewTextRendering {
    static let softWrapCharacterLimit = 400
    static let previewTextLengthLimit = 2000

    static func prepare(_ text: String) -> PreparedPreviewText {
        let originalCount = text.count
        let base: String
        let didTruncate: Bool
        if originalCount > previewTextLengthLimit {
            let cutoff = text.index(text.startIndex, offsetBy: previewTextLengthLimit)
            base = String(text[..<cutoff]) + "…"
            didTruncate = true
        } else {
            base = text
            didTruncate = false
        }

        let rendered: String
        if base.count > softWrapCharacterLimit {
            rendered = base
        } else {
            rendered = softWrappedText(base)
        }
        return PreparedPreviewText(
            renderText: rendered,
            didTruncate: didTruncate,
            originalCount: originalCount
        )
    }

    static func softWrappedText(_ text: String) -> String {
        var result = String()
        result.reserveCapacity(text.count * 4)
        var first = true
        for character in text {
            if first {
                first = false
            } else {
                result.append("\u{200B}")
            }
            result.append(character)
        }
        return result
    }
}
