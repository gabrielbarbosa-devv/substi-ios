import UIKit

@MainActor
final class OrderViewController: UIViewController {
    var onChooseSubstitute: ((ProductID) -> Void)?

    private let viewModel: OrderViewModel
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = DSColor.brandPrimary
    }

    private func buildHierarchy() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = DSSpacing.large

        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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
            contentStackView.addArrangedSubview(DSProductCardView(content: content))
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
            chooseSubstituteButton.isHidden = true
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

            chooseSubstituteButton.addTarget(
                self,
                action: #selector(didTapChooseSubstitute),
                for: .primaryActionTriggered
            )
            contentStackView.addArrangedSubview(chooseSubstituteButton)
        }
    }

    @objc private func didTapChooseSubstitute() {
        guard let productID = viewModel.firstUnavailableProductID else { return }
        onChooseSubstitute?(productID)
    }
}
