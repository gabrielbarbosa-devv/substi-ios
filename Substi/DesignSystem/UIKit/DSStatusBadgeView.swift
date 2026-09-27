import UIKit

final class DSStatusBadgeView: UIView {
    enum Style {
        case success
        case warning
        case error
        case information

        var foregroundColor: UIColor {
            switch self {
            case .success: DSColor.statusSuccess
            case .warning: DSColor.statusWarning
            case .error: DSColor.statusError
            case .information: DSColor.brandPrimary
            }
        }

        var labelColor: UIColor { DSColor.textPrimary }

        var backgroundColor: UIColor {
            switch self {
            case .success: DSColor.surfaceSuccess
            case .warning: DSColor.surfaceWarning
            case .error: DSColor.surfaceError
            case .information: DSColor.surfaceInformation
            }
        }

        var symbolName: String {
            switch self {
            case .success: "checkmark.circle.fill"
            case .warning: "exclamationmark.circle.fill"
            case .error: "xmark.circle.fill"
            case .information: "info.circle.fill"
            }
        }
    }

    private let iconView = UIImageView()
    private let titleLabel = UILabel()

    init(text: String, style: Style) {
        super.init(frame: .zero)
        configure(text: text, style: style)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(text: String, style: Style) {
        let stackView = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = DSSpacing.xSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false

        iconView.image = UIImage(systemName: style.symbolName)
        iconView.tintColor = style.foregroundColor
        iconView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .caption1)
        iconView.setContentHuggingPriority(.required, for: .horizontal)
        iconView.isAccessibilityElement = false

        titleLabel.text = text
        titleLabel.font = DSTypography.small
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = style.labelColor
        titleLabel.numberOfLines = 0
        titleLabel.isAccessibilityElement = false

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.xSmall),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.xSmall),
            iconView.widthAnchor.constraint(equalToConstant: 18),
            iconView.heightAnchor.constraint(equalToConstant: 18)
        ])

        backgroundColor = style.backgroundColor
        layer.cornerRadius = DSRadius.large
        isAccessibilityElement = true
        accessibilityLabel = text
    }
}
