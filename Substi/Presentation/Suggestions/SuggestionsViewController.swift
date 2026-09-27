import UIKit

struct SuggestionsViewModel {
    let originalProduct: Product
    let originalPriceText: String?
    let candidates: [SubstitutionCandidate]

    init(originalProduct: Product, originalPrice: Decimal?, candidates: [SubstitutionCandidate]) {
        self.originalProduct = originalProduct
        self.candidates = candidates

        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        priceFormatter.locale = Locale(identifier: "pt_BR")
        priceFormatter.currencyCode = "BRL"
        originalPriceText = originalPrice.flatMap {
            priceFormatter.string(from: $0 as NSDecimalNumber)
        }
    }

    func cardContent(for candidate: SubstitutionCandidate) -> DSProductCardContent {
        let categoryMatches = ProductSubstitutionRanker().categoryScore(
            for: candidate,
            replacing: originalProduct
        ) == 1
        let quantityMatches = originalProduct.quantity != nil
            && originalProduct.quantity == candidate.product.quantity

        let evidence = [
            categoryMatches ? "Categoria correspondente" : nil,
            quantityMatches ? "Quantidade correspondente" : nil
        ].compactMap { $0 }

        return DSProductCardContent(
            name: candidate.product.name,
            brand: candidate.product.brand,
            quantity: candidate.product.quantity,
            statusText: evidence.isEmpty ? "Confira as diferenças" : evidence.joined(separator: " · "),
            statusStyle: evidence.isEmpty ? .information : .compatible
        )
    }
}

@MainActor
final class SuggestionsViewController: UIViewController {
    var onShowComparison: ((SubstitutionCandidate) -> Void)? {
        didSet { updateContinueButton() }
    }

    private let viewModel: SuggestionsViewModel
    private let contentStackView = UIStackView()
    private let compareButton = DSButton(title: "Ver comparação")
    private var candidateCards: [ProductID: DSProductCardView] = [:]
    private var selectedCandidateID: ProductID?

    init(viewModel: SuggestionsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DSColor.backgroundPrimary
        navigationItem.title = "Escolher substituto"
        navigationController?.navigationBar.prefersLargeTitles = false
        buildHierarchy()
        render()
    }

    private func buildHierarchy() {
        let scrollView = UIScrollView()
        let actionContainer = UIView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        actionContainer.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = DSSpacing.medium

        view.addSubview(scrollView)
        view.addSubview(actionContainer)
        scrollView.addSubview(contentStackView)
        actionContainer.addSubview(compareButton)

        compareButton.translatesAutoresizingMaskIntoConstraints = false
        compareButton.addTarget(self, action: #selector(didTapCompare), for: .primaryActionTriggered)
        compareButton.isEnabled = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: actionContainer.topAnchor),
            actionContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            compareButton.leadingAnchor.constraint(equalTo: actionContainer.leadingAnchor, constant: DSSpacing.medium),
            compareButton.trailingAnchor.constraint(equalTo: actionContainer.trailingAnchor, constant: -DSSpacing.medium),
            compareButton.topAnchor.constraint(equalTo: actionContainer.topAnchor, constant: DSSpacing.small),
            compareButton.bottomAnchor.constraint(equalTo: actionContainer.bottomAnchor, constant: -DSSpacing.small),
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
                constant: -DSSpacing.large
            ),
            contentStackView.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor,
                constant: -2 * DSSpacing.medium
            )
        ])

        actionContainer.backgroundColor = DSColor.backgroundPrimary
        actionContainer.layer.borderColor = DSColor.borderDefault.cgColor
        actionContainer.layer.borderWidth = 0.5
    }

    private func render() {
        let originalHeading = makeLabel("Item original", style: .body)
        contentStackView.addArrangedSubview(originalHeading)
        contentStackView.addArrangedSubview(
            DSProductCardView(
                content: DSProductCardContent(
                    name: viewModel.originalProduct.name,
                    brand: viewModel.originalProduct.brand,
                    quantity: viewModel.originalProduct.quantity,
                    priceText: viewModel.originalPriceText,
                    statusText: "Produto original",
                    statusStyle: .information
                )
            )
        )

        contentStackView.addArrangedSubview(makeLabel("Opções para comparar", style: .headline))
        contentStackView.addArrangedSubview(
            makeLabel("Confira categoria e quantidade antes de escolher.", style: .body, color: DSColor.textSecondary)
        )

        if viewModel.candidates.isEmpty {
            let emptyState = DSInfoBannerView(
                title: "Nenhuma alternativa encontrada",
                subtitle: "Não há opções nos dados de demonstração para este produto."
            )
            contentStackView.addArrangedSubview(emptyState)
            compareButton.isHidden = true
            return
        }

        for candidate in viewModel.candidates {
            let card = DSProductCardView(content: viewModel.cardContent(for: candidate))
            candidateCards[candidate.product.id] = card
            contentStackView.addArrangedSubview(card)
            configureSelection(for: candidate)
        }

        updateContinueButton()
    }

    private func configureSelection(for candidate: SubstitutionCandidate) {
        let isSelected = selectedCandidateID == candidate.product.id
        candidateCards[candidate.product.id]?.configureSelection(isSelected: isSelected) { [weak self] in
            self?.select(candidate)
        }
    }

    private func select(_ candidate: SubstitutionCandidate) {
        selectedCandidateID = candidate.product.id
        viewModel.candidates.forEach(configureSelection)
        updateContinueButton()
    }

    private func updateContinueButton() {
        compareButton.isEnabled = selectedCandidateID != nil && onShowComparison != nil
        compareButton.accessibilityHint = onShowComparison == nil
            ? "A tela de comparação será conectada na próxima etapa."
            : "Abre a comparação com a alternativa selecionada."
    }

    private func makeLabel(
        _ text: String,
        style: UIFont.TextStyle,
        color: UIColor = DSColor.textPrimary
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: style)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = color
        label.numberOfLines = 0
        return label
    }

    @objc private func didTapCompare() {
        guard
            let selectedCandidateID,
            let candidate = viewModel.candidates.first(where: { $0.product.id == selectedCandidateID })
        else {
            return
        }
        onShowComparison?(candidate)
    }
}
