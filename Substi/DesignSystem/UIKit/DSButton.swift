import UIKit

final class DSButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                accessibilityTraits.remove(.notEnabled)
            } else {
                accessibilityTraits.insert(.notEnabled)
            }
        }
    }

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
        buttonConfiguration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var attributes = $0
            attributes.font = UIFont.preferredFont(forTextStyle: .headline)
            return attributes
        }
        configuration = buttonConfiguration
        titleLabel?.adjustsFontForContentSizeCategory = true
        accessibilityTraits.insert(.button)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
