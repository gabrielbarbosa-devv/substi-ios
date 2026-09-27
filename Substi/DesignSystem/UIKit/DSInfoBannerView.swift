import UIKit

final class DSInfoBannerView: UIView {
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        configure(title: title, subtitle: subtitle)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(title: String, subtitle: String) {
        let iconView = UIImageView(image: UIImage(systemName: "info.circle"))
        iconView.tintColor = DSColor.brandPrimary
        iconView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title2)
        iconView.setContentHuggingPriority(.required, for: .horizontal)
        iconView.isAccessibilityElement = false

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = DSTypography.bodyEmphasized
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = DSColor.textPrimary
        titleLabel.numberOfLines = 0
        titleLabel.isAccessibilityElement = false

        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = DSTypography.body
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.textColor = DSColor.textSecondary
        subtitleLabel.numberOfLines = 0
        subtitleLabel.isAccessibilityElement = false

        let labels = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labels.axis = .vertical
        labels.spacing = DSSpacing.xxSmall

        let content = UIStackView(arrangedSubviews: [iconView, labels])
        content.axis = .horizontal
        content.alignment = .center
        content.spacing = DSSpacing.medium
        content.translatesAutoresizingMaskIntoConstraints = false

        addSubview(content)
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.medium),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.medium),
            content.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.medium),
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.medium)
        ])

        backgroundColor = DSColor.surfaceInformation
        layer.cornerRadius = DSRadius.large
        isAccessibilityElement = true
        accessibilityLabel = "\(title). \(subtitle)"
    }
}
