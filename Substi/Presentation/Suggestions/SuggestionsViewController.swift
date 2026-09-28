import SubstiDomain
import UIKit

@MainActor
final class SuggestionsViewController: UIViewController {
    var onShowComparison: ((SubstitutionCandidate) -> Void)? {
        didSet { updateContinueButton() }
    }

    private let viewModel: SuggestionsViewModel
    private var loadTask: Task<Void, Never>?
    private let contentStackView = UIStackView()
    private let resultsStackView = UIStackView()
    private let compareButton = DSButton(title: "Ver comparação")
    private var candidateCards: [ProductID: DSProductCardView] = [:]
    private var selectedCandidateID: ProductID?

    init(viewModel: SuggestionsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.onStateChange = { [weak self] state in
            self?.render(state: state)
        }
    }

    deinit {
        loadTask?.cancel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DSColor.backgroundPrimary
        navigationItem.title = "Escolher substituto"
        navigationItem.backButtonTitle = "Voltar"
        navigationController?.navigationBar.prefersLargeTitles = false
        buildHierarchy()
        render()
        loadCandidates()
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
        resultsStackView.axis = .vertical
        resultsStackView.alignment = .fill
        resultsStackView.spacing = DSSpacing.medium

        view.addSubview(scrollView)
        view.addSubview(actionContainer)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(makeLabel("Item original", style: .body))
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
        contentStackView.addArrangedSubview(makeLabel("Alternativas disponíveis", style: .headline))
        contentStackView.addArrangedSubview(
            makeLabel("Confira categoria e quantidade antes de escolher.", style: .body, color: DSColor.textSecondary)
        )
        contentStackView.addArrangedSubview(resultsStackView)
        actionContainer.addSubview(compareButton)

        compareButton.translatesAutoresizingMaskIntoConstraints = false
        compareButton.addTarget(self, action: #selector(didTapCompare), for: .primaryActionTriggered)
        compareButton.accessibilityIdentifier = "suggestions-view-comparison"
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
        render(state: viewModel.state)
    }

    private func render(state: SuggestionsViewModel.State) {
        resultsStackView.arrangedSubviews.forEach { subview in
            resultsStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        candidateCards.removeAll()
        selectedCandidateID = nil

        switch state {
        case .idle:
            compareButton.isHidden = true
        case .loading:
            let loadingIndicator = UIActivityIndicatorView(style: .medium)
            loadingIndicator.startAnimating()
            loadingIndicator.accessibilityLabel = "Carregando alternativas"
            resultsStackView.addArrangedSubview(loadingIndicator)
            resultsStackView.addArrangedSubview(
                makeLabel("Buscando produtos na Open Food Facts…", style: .body, color: DSColor.textSecondary)
            )
            compareButton.isHidden = true
        case let .content(candidates, failedCount):
            for candidate in candidates {
                let card = DSProductCardView(content: viewModel.cardContent(for: candidate))
                card.accessibilityIdentifier = "suggestion-candidate-\(candidate.product.id.rawValue)"
                candidateCards[candidate.product.id] = card
                resultsStackView.addArrangedSubview(card)
                configureSelection(for: candidate)
            }
            if failedCount > 0 {
                resultsStackView.addArrangedSubview(
                    DSInfoBannerView(
                        title: "Algumas opções não carregaram",
                        subtitle: "Você pode comparar as opções disponíveis ou tentar carregar novamente."
                    )
                )
                resultsStackView.addArrangedSubview(makeRetryButton())
            }
            compareButton.isHidden = false
        case .empty:
            resultsStackView.addArrangedSubview(
                DSInfoBannerView(
                    title: "Nenhuma alternativa encontrada",
                    subtitle: "Nenhum código de produto foi configurado para este item."
                )
            )
            compareButton.isHidden = true
        case .error:
            resultsStackView.addArrangedSubview(
                DSInfoBannerView(
                    title: "Não foi possível carregar as alternativas",
                    subtitle: "Verifique sua conexão e tente novamente."
                )
            )
            resultsStackView.addArrangedSubview(makeRetryButton())
            compareButton.isHidden = true
        }
        updateContinueButton()
    }

    private func loadCandidates() {
        loadTask?.cancel()
        let viewModel = self.viewModel
        loadTask = Task { await viewModel.loadCandidates() }
    }

    private func makeRetryButton() -> UIButton {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "Tentar novamente"
        configuration.image = UIImage(systemName: "arrow.clockwise")
        configuration.imagePadding = DSSpacing.xSmall
        let button = UIButton(configuration: configuration)
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        button.addTarget(self, action: #selector(didTapRetry), for: .primaryActionTriggered)
        return button
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
        if case .content = viewModel.state {
            compareButton.isHidden = false
        }
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

    @objc private func didTapRetry() {
        loadCandidates()
    }
}
