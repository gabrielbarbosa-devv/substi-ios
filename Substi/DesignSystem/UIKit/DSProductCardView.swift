import UIKit

struct DSProductCardContent {
    let name: String
    let brand: String?
    let quantity: String?
    let statusText: String?
    let statusStyle: DSStatusBadgeView.Style?
}

final class DSProductCardView: UIView {
    private let productImageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailsLabel = UILabel()
    private let statusBadge: DSStatusBadgeView?

    init(content: DSProductCardContent) {
        statusBadge = content.statusText.flatMap { text in
            content.statusStyle.map { DSStatusBadgeView(text: text, style: $0) }
        }
        super.init(frame: .zero)
        configure(content: content)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(content: DSProductCardContent) {
        backgroundColor = DSColor.surfacePrimary
        layer.cornerRadius = DSRadius.large
        layer.borderWidth = 1
        layer.borderColor = DSColor.borderDefault.cgColor

        productImageView.image = UIImage(systemName: "shippingbox")
        productImageView.tintColor = DSColor.brandPrimary
        productImageView.contentMode = .scaleAspectFit
        productImageView.backgroundColor = DSColor.backgroundSecondary
        productImageView.layer.cornerRadius = DSRadius.medium
        productImageView.isAccessibilityElement = false

        nameLabel.text = content.name
        nameLabel.font = DSTypography.bodyEmphasized
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = DSColor.textPrimary
        nameLabel.numberOfLines = 0

        let details = [content.brand, content.quantity].compactMap { $0 }
        detailsLabel.text = details.joined(separator: " · ")
        detailsLabel.font = DSTypography.body
        detailsLabel.adjustsFontForContentSizeCategory = true
        detailsLabel.textColor = DSColor.textSecondary
        detailsLabel.numberOfLines = 0

        let productDetails = UIStackView(arrangedSubviews: [nameLabel, detailsLabel])
        productDetails.axis = .vertical
        productDetails.alignment = .leading
        productDetails.spacing = DSSpacing.xxSmall

        let productRow = UIStackView(arrangedSubviews: [productImageView, productDetails])
        productRow.axis = .horizontal
        productRow.alignment = .top
        productRow.spacing = DSSpacing.medium

        let cardContent = UIStackView(arrangedSubviews: [productRow])
        cardContent.axis = .vertical
        cardContent.spacing = DSSpacing.medium
        if let statusBadge {
            cardContent.addArrangedSubview(statusBadge)
        }
        cardContent.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(cardContent)
        NSLayoutConstraint.activate([
            cardContent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.medium),
            cardContent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.medium),
            cardContent.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.medium),
            cardContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.medium),
            productImageView.widthAnchor.constraint(equalToConstant: 64),
            productImageView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
