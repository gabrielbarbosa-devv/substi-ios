import UIKit

struct SuggestionsViewModel {
    let originalProduct: Product
    let candidates: [SubstitutionCandidate]

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
            statusStyle: evidence.isEmpty ? .information : .success
        )
    }
}

@MainActor
final class SuggestionsViewController: UIViewController {
    private let viewModel: SuggestionsViewModel
    private let contentStackView = UIStackView()

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
        navigationItem.title = "Sugestões"
        buildHierarchy()
        render()
    }

    private func buildHierarchy() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
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
        let introduction = UILabel()
        introduction.text = "Alternativas para \(viewModel.originalProduct.name)"
        introduction.font = DSTypography.headline
        introduction.adjustsFontForContentSizeCategory = true
        introduction.textColor = DSColor.textPrimary
        introduction.numberOfLines = 0
        contentStackView.addArrangedSubview(introduction)

        contentStackView.addArrangedSubview(
            DSProductCardView(
                content: DSProductCardContent(
                    name: viewModel.originalProduct.name,
                    brand: viewModel.originalProduct.brand,
                    quantity: viewModel.originalProduct.quantity,
                    statusText: "Produto original",
                    statusStyle: .information
                )
            )
        )

        if viewModel.candidates.isEmpty {
            let emptyLabel = UILabel()
            emptyLabel.text = "Não há alternativas nos dados de demonstração para este produto."
            emptyLabel.font = DSTypography.body
            emptyLabel.adjustsFontForContentSizeCategory = true
            emptyLabel.textColor = DSColor.textSecondary
            emptyLabel.numberOfLines = 0
            contentStackView.addArrangedSubview(emptyLabel)
            return
        }

        let alternativesTitle = UILabel()
        alternativesTitle.text = "Alternativas"
        alternativesTitle.font = DSTypography.headline
        alternativesTitle.adjustsFontForContentSizeCategory = true
        alternativesTitle.textColor = DSColor.textPrimary
        contentStackView.addArrangedSubview(alternativesTitle)

        for candidate in viewModel.candidates {
            contentStackView.addArrangedSubview(
                DSProductCardView(content: viewModel.cardContent(for: candidate))
            )
        }
    }
}
