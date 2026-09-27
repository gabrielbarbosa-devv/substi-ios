import UIKit

@MainActor
final class OrderViewController: UIViewController {
    var onChooseSubstitute: ((ProductID) -> Void)?

    private let viewModel: OrderViewModel
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    private let chooseSubstituteButton = DSButton(title: "Escolher substituto")

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
        let countLabel = UILabel()
        countLabel.text = viewModel.itemCountText
        countLabel.font = DSTypography.body
        countLabel.adjustsFontForContentSizeCategory = true
        countLabel.textColor = DSColor.textSecondary
        contentStackView.addArrangedSubview(countLabel)

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
            let explanationLabel = UILabel()
            explanationLabel.text = "Um item ficou indisponível durante a preparação. Veja as informações e escolha uma alternativa."
            explanationLabel.font = DSTypography.body
            explanationLabel.adjustsFontForContentSizeCategory = true
            explanationLabel.textColor = DSColor.textPrimary
            explanationLabel.numberOfLines = 0
            contentStackView.addArrangedSubview(explanationLabel)

            for item in unavailableItems {
                contentStackView.addArrangedSubview(
                    DSProductCardView(
                        content: DSProductCardContent(
                            name: item.product.name,
                            brand: item.product.brand,
                            quantity: item.product.quantity,
                            statusText: "Indisponível",
                            statusStyle: .error
                        )
                    )
                )
            }

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
