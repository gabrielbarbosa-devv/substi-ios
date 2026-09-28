import SubstiDomain
import UIKit

@MainActor
final class OrderViewController: UIViewController {
    var onChooseSubstitute: ((ProductID) -> Void)?

    private let viewModel: OrderViewModel
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    private let actionContainer = UIView()
    private let chooseSubstituteButton = DSButton(title: "Escolher substituto")
    private let statusBanner = DSStatusBannerView(
        title: "Em preparação",
        subtitle: "Estamos preparando seus itens."
    )

    init(viewModel: OrderViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        buildHierarchy()
        render()
    }

    private func configureView() {
        view.backgroundColor = DSColor.backgroundPrimary
        navigationItem.title = "Meu pedido"
        navigationItem.backButtonTitle = "Voltar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = DSColor.brandPrimary
    }

    private func buildHierarchy() {
        let rootStackView = UIStackView(arrangedSubviews: [scrollView, actionContainer])
        rootStackView.axis = .vertical
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        actionContainer.translatesAutoresizingMaskIntoConstraints = false
        chooseSubstituteButton.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = DSSpacing.large

        view.addSubview(rootStackView)
        scrollView.addSubview(contentStackView)
        actionContainer.addSubview(chooseSubstituteButton)
        actionContainer.backgroundColor = DSColor.backgroundPrimary
        actionContainer.layer.borderColor = DSColor.borderDefault.cgColor
        actionContainer.layer.borderWidth = 0.5
        chooseSubstituteButton.accessibilityIdentifier = "order-choose-substitute"
        chooseSubstituteButton.addTarget(
            self,
            action: #selector(didTapChooseSubstitute),
            for: .primaryActionTriggered
        )

        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            chooseSubstituteButton.leadingAnchor.constraint(
                equalTo: actionContainer.leadingAnchor,
                constant: DSSpacing.medium
            ),
            chooseSubstituteButton.trailingAnchor.constraint(
                equalTo: actionContainer.trailingAnchor,
                constant: -DSSpacing.medium
            ),
            chooseSubstituteButton.topAnchor.constraint(
                equalTo: actionContainer.topAnchor,
                constant: DSSpacing.small
            ),
            chooseSubstituteButton.bottomAnchor.constraint(
                equalTo: actionContainer.bottomAnchor,
                constant: -DSSpacing.small
            ),
            contentStackView.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: DSSpacing.medium
            ),
            contentStackView.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -DSSpacing.medium
            ),
            contentStackView.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor,
                constant: DSSpacing.medium
            ),
            contentStackView.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -DSSpacing.xLarge
            ),
            contentStackView.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor,
                constant: -2 * DSSpacing.medium
            )
        ])
    }

    private func render() {
        contentStackView.addArrangedSubview(statusBanner)

        for item in viewModel.items {
            let content: DSProductCardContent
            switch item.availability {
            case .available:
                content = DSProductCardContent(
                    name: item.product.name,
                    brand: item.product.brand,
                    quantity: item.product.quantity,
                    priceText: item.priceText,
                    statusText: nil,
                    statusStyle: nil,
                    state: .available
                )
            case .unavailable:
                content = DSProductCardContent(
                    name: item.product.name,
                    brand: item.product.brand,
                    quantity: item.product.quantity,
                    priceText: item.priceText,
                    statusText: "Indisponível",
                    statusStyle: .unavailable,
                    state: .unavailable
                )
            case .substituted:
                content = DSProductCardContent(
                    name: item.product.name,
                    brand: item.product.brand,
                    quantity: item.product.quantity,
                    priceText: item.priceText,
                    statusText: "Substituído",
                    statusStyle: .substituted,
                    state: .substituted
                )
            }
            let card = DSProductCardView(content: content)
            card.accessibilityIdentifier = "order-product-\(item.product.id.rawValue)"
            contentStackView.addArrangedSubview(card)
        }

        if viewModel.unavailableItemCount == 0 {
            let message = UILabel()
            let hasSubstitution = viewModel.items.contains {
                if case .substituted = $0.availability { return true }
                return false
            }
            message.text = hasSubstitution
                ? "Substituição confirmada. Seu pedido foi atualizado."
                : "Seu pedido ainda não tem produtos indisponíveis."
            message.font = DSTypography.body
            message.adjustsFontForContentSizeCategory = true
            message.textColor = DSColor.textSecondary
            message.numberOfLines = 0
            contentStackView.addArrangedSubview(message)
            actionContainer.isHidden = true
        } else {
            let substitutionCount = viewModel.unavailableItemCount
            contentStackView.addArrangedSubview(
                DSInfoBannerView(
                    title: substitutionCount == 1
                        ? "1 item precisa de substituição"
                        : "\(substitutionCount) itens precisam de substituição",
                    subtitle: "Escolha uma alternativa para continuar com seu pedido."
                )
            )

            actionContainer.isHidden = false
        }
    }

    @objc private func didTapChooseSubstitute() {
        guard let productID = viewModel.firstUnavailableProductID else { return }
        onChooseSubstitute?(productID)
    }
}
