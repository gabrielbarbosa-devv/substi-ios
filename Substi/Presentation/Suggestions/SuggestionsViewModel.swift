import SubstiDomain
import UIKit

@MainActor
final class SuggestionsViewModel {
    enum State {
        case idle
        case loading
        case content([SubstitutionCandidate], failedCount: Int)
        case empty
        case error
    }

    let originalProduct: Product
    let originalPriceText: String?
    private let candidateBarcodes: [String]
    private let loadCandidates: LoadSubstitutionCandidatesUseCase
    private let ranker: ProductSubstitutionRanker
    private(set) var state: State = .idle
    var onStateChange: ((State) -> Void)?
    private var activeRequestID: UUID?

    var candidates: [SubstitutionCandidate] {
        guard case let .content(candidates, _) = state else { return [] }
        return candidates
    }

    init(
        originalProduct: Product,
        originalPrice: Decimal?,
        candidateBarcodes: [String],
        loadCandidates: LoadSubstitutionCandidatesUseCase,
        ranker: ProductSubstitutionRanker = ProductSubstitutionRanker()
    ) {
        self.originalProduct = originalProduct
        self.candidateBarcodes = candidateBarcodes
        self.loadCandidates = loadCandidates
        self.ranker = ranker

        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        priceFormatter.locale = Locale(identifier: "pt_BR")
        priceFormatter.currencyCode = "BRL"
        originalPriceText = originalPrice.flatMap {
            priceFormatter.string(from: $0 as NSDecimalNumber)
        }
    }

    func loadCandidates() async {
        let requestID = UUID()
        activeRequestID = requestID
        update(state: .loading)

        let outcome = await loadCandidates.execute(
            originalProduct: originalProduct,
            candidateBarcodes: candidateBarcodes
        )

        guard activeRequestID == requestID else { return }
        activeRequestID = nil

        switch outcome {
        case let .loaded(candidates, failedCount):
            update(state: .content(candidates, failedCount: failedCount))
            AppLog.suggestions.info(
                "Candidates loaded: \(candidates.count, privacy: .public), failed: \(failedCount, privacy: .public)"
            )
        case .empty:
            update(state: .empty)
        case let .failed(failedCount):
            update(state: .error)
            AppLog.suggestions.info("No candidates loaded; failed: \(failedCount, privacy: .public)")
        case .cancelled:
            update(state: .idle)
        }
    }

    private func update(state: State) {
        self.state = state
        onStateChange?(state)
    }

    func cardContent(for candidate: SubstitutionCandidate) -> DSProductCardContent {
        let categoryMatches = ranker.categoryScore(
            for: candidate,
            replacing: originalProduct
        ) == 1
        let quantityMatches = ranker.quantityScore(for: candidate, replacing: originalProduct) == 1

        let evidence = [
            categoryMatches ? "Categoria correspondente" : nil,
            quantityMatches ? "Quantidade correspondente" : nil
        ].compactMap { $0 }

        return DSProductCardContent(
            name: candidate.product.name,
            brand: candidate.product.brand,
            quantity: candidate.product.quantity,
            imageSymbolName: ProductImagePlaceholder.symbolName(for: candidate.product.category),
            statusText: evidence.isEmpty ? "Confira as diferenças" : evidence.joined(separator: " · "),
            statusStyle: evidence.isEmpty ? .information : .compatible
        )
    }
}
