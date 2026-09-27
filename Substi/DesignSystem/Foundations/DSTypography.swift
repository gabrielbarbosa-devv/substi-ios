import UIKit

enum DSTypography {
    static let largeTitle = UIFont.preferredFont(forTextStyle: .largeTitle)
    static let title = UIFontMetrics(forTextStyle: .title2).scaledFont(
        for: .systemFont(ofSize: 24, weight: .semibold)
    )
    static let headline = UIFont.preferredFont(forTextStyle: .headline)
    static let body = UIFont.preferredFont(forTextStyle: .body)
    static let bodyEmphasized = UIFontMetrics(forTextStyle: .body).scaledFont(
        for: .systemFont(ofSize: 16, weight: .semibold)
    )
    static let caption = UIFont.preferredFont(forTextStyle: .caption1)
    static let small = UIFont.preferredFont(forTextStyle: .footnote)
    static let price = UIFontMetrics(forTextStyle: .title3).scaledFont(
        for: .systemFont(ofSize: 20, weight: .semibold)
    )
    static let button = UIFontMetrics(forTextStyle: .headline).scaledFont(
        for: .systemFont(ofSize: 17, weight: .semibold)
    )
}
