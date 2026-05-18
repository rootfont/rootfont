import Foundation

enum FontPreviewSurface: String, CaseIterable, Identifiable {
    case sample
    case code
    var id: Self { self }
}

struct PreparedPreviewText: Sendable {
    let renderText: String
    let didTruncate: Bool
    let originalCount: Int
}
