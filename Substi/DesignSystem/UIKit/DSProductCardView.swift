import UIKit

struct DSProductCardContent {
    enum State: Equatable {
        case available
        case unavailable
        case substituted

        var accessibilityText: String {
            switch self {
            case .available: "Disponível"
            case .unavailable: "Indisponível"
            case .substituted: "Substituído"
            }
        }
    }

    let name: String
    let brand: String?
    let quantity: String?
    let image: UIImage?
    let priceText: String?
    let statusText: String?
    let statusStyle: DSStatusBadgeView.Style?
    let state: State?

    init(
        name: String,
        brand: String?,
        quantity: String?,
        image: UIImage? = nil,
        priceText: String? = nil,
        statusText: String?,
        statusStyle: DSStatusBadgeView.Style?,
        state: State? = nil
    ) {
        self.name = name
        self.brand = brand
        self.quantity = quantity
        self.image = image
        self.priceText = priceText
        self.statusText = statusText
        self.statusStyle = statusStyle
        self.state = state
    }
}

final class DSProductCardView: UIView {
    private let productImageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailsLabel = UILabel()
    private let priceLabel = UILabel()
    private let statusBadge: DSStatusBadgeView?
    private let accessoryImageView = UIImageView()
    private var selectionAction: (() -> Void)?

    init(content: DSProductCardContent) {
        if let statusText = content.statusText, let statusStyle = content.statusStyle {
            statusBadge = DSStatusBadgeView(text: statusText, style: statusStyle)
        } else {
            switch content.state {
            case .unavailable:
                statusBadge = DSStatusBadgeView(text: "Indisponível", style: .unavailable)
            case .substituted:
                statusBadge = DSStatusBadgeView(text: "Substituído", style: .substituted)
            case .available, nil:
                statusBadge = nil
            }
        }
        super.init(frame: .zero)
        configure(content: content)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(content: DSProductCardContent) {
        productImageView.image = content.image ?? UIImage(systemName: "shippingbox")
        productImageView.tintColor = DSColor.brandPrimary
        productImageView.contentMode = .scaleAspectFit
        productImageView.backgroundColor = DSColor.backgroundSecondary
        productImageView.layer.cornerRadius = DSRadius.medium
        productImageView.isAccessibilityElement = false

        backgroundColor = content.state == .unavailable ? DSColor.surfaceError : DSColor.surfacePrimary
        layer.cornerRadius = DSRadius.large
        layer.borderWidth = content.state == .unavailable ? 0 : 1
        layer.borderColor = DSColor.borderDefault.cgColor

        nameLabel.text = content.name
        nameLabel.font = DSTypography.bodyEmphasized
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = DSColor.textPrimary
        nameLabel.numberOfLines = 0

        let details = [content.quantity, content.brand].compactMap { $0 }
        detailsLabel.text = details.joined(separator: " · ")
        detailsLabel.font = DSTypography.body
        detailsLabel.adjustsFontForContentSizeCategory = true
        detailsLabel.textColor = DSColor.textSecondary
        detailsLabel.numberOfLines = 0

        priceLabel.text = content.priceText
        priceLabel.font = DSTypography.price
        priceLabel.adjustsFontForContentSizeCategory = true
        priceLabel.textColor = DSColor.textPrimary
        priceLabel.isHidden = content.priceText == nil

        let productDetails = UIStackView(arrangedSubviews: [nameLabel, detailsLabel, priceLabel])
        productDetails.axis = .vertical
        productDetails.alignment = .leading
        productDetails.spacing = DSSpacing.xxSmall

        let textAndAccessory = UIStackView(arrangedSubviews: [productDetails, accessoryImageView])
        textAndAccessory.axis = .horizontal
        textAndAccessory.alignment = .top
        textAndAccessory.spacing = DSSpacing.xSmall

        accessoryImageView.contentMode = .scaleAspectFit
        accessoryImageView.isAccessibilityElement = false
        switch content.state {
        case .available:
            accessoryImageView.image = UIImage(systemName: "checkmark.circle.fill")
            accessoryImageView.tintColor = DSColor.statusSuccess
        case .unavailable:
            accessoryImageView.image = UIImage(systemName: "chevron.right")
            accessoryImageView.tintColor = DSColor.statusError
        case .substituted:
            accessoryImageView.image = UIImage(systemName: "checkmark.seal.fill")
            accessoryImageView.tintColor = DSColor.statusSuccess
        case nil:
            accessoryImageView.isHidden = true
        }
        accessoryImageView.setContentHuggingPriority(.required, for: .horizontal)

        let productRow = UIStackView(arrangedSubviews: [productImageView, textAndAccessory])
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
            productImageView.heightAnchor.constraint(equalToConstant: 64),
            accessoryImageView.widthAnchor.constraint(equalToConstant: 28),
            accessoryImageView.heightAnchor.constraint(equalToConstant: 28)
        ])

        let accessibilityDetails = [
            content.quantity,
            content.brand,
            content.priceText,
            content.statusText ?? content.state?.accessibilityText
        ]
            .compactMap { $0 }
            .joined(separator: ", ")
        isAccessibilityElement = true
        accessibilityLabel = [content.name, accessibilityDetails]
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }

    func configureSelection(isSelected: Bool, action: @escaping () -> Void) {
        selectionAction = action
        accessoryImageView.isHidden = false
        accessoryImageView.image = UIImage(
            systemName: isSelected ? "largecircle.fill.circle" : "circle"
        )
        accessoryImageView.tintColor = isSelected ? DSColor.brandPrimary : DSColor.textSecondary
        layer.borderWidth = isSelected ? 2 : 1
        layer.borderColor = (isSelected ? DSColor.brandPrimary : DSColor.borderDefault).cgColor
        accessibilityTraits = [.button]
        if isSelected {
            accessibilityTraits.insert(.selected)
        }
        accessibilityValue = isSelected ? "Selecionado" : "Não selecionado"
        accessibilityHint = "Toque para selecionar esta alternativa."

        let hasSelectionGesture = gestureRecognizers?.contains { $0 is UITapGestureRecognizer } ?? false
        if !hasSelectionGesture {
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapSelection)))
        }
    }

    @objc private func didTapSelection() {
        selectionAction?()
    }

    override func accessibilityActivate() -> Bool {
        guard let selectionAction else { return super.accessibilityActivate() }
        selectionAction()
        return true
    }
}
