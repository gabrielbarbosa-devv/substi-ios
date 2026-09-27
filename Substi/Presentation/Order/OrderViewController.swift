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

        let unavailableItems = viewModel.items.filter { $0.availability == .unavailable }
        if unavailableItems.isEmpty {
            let emptyLabel = UILabel()
            emptyLabel.text = "Seu pedido ainda não tem produtos indisponíveis."
            emptyLabel.font = DSTypography.body
            emptyLabel.adjustsFontForContentSizeCategory = true
            emptyLabel.textColor = DSColor.textSecondary
            emptyLabel.numberOfLines = 0
            contentStackView.addArrangedSubview(emptyLabel)
            chooseSubstituteButton.isHidden = true
        } else {
            for item in viewModel.items {
                let isUnavailable = item.availability == .unavailable
                contentStackView.addArrangedSubview(
                    DSProductCardView(
                        content: DSProductCardContent(
                            name: item.product.name,
                            brand: item.product.brand,
                            quantity: item.product.quantity,
                            priceText: item.priceText,
                            statusText: isUnavailable ? "Indisponível" : nil,
                            statusStyle: isUnavailable ? .unavailable : nil,
                            state: isUnavailable ? .unavailable : .available
                        )
                    )
                )
            }

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
