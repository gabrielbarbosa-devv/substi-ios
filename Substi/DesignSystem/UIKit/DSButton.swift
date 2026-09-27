import UIKit

final class DSButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)

        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.baseBackgroundColor = DSColor.interactivePrimary
        buttonConfiguration.baseForegroundColor = DSColor.textInverse
        buttonConfiguration.cornerStyle = .medium
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(
            top: DSSpacing.medium,
            leading: DSSpacing.large,
            bottom: DSSpacing.medium,
            trailing: DSSpacing.large
        )
        configuration = buttonConfiguration
        titleLabel?.font = DSTypography.button
        titleLabel?.adjustsFontForContentSizeCategory = true
        minimumContentSizeCategory = .accessibilityMedium
        accessibilityTraits.insert(.button)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
