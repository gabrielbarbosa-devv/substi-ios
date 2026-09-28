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
    private let loadProduct: LoadProductUseCase
    private(set) var state: State = .idle
    var onStateChange: ((State) -> Void)?

    var candidates: [SubstitutionCandidate] {
        guard case let .content(candidates, _) = state else { return [] }
        return candidates
    }

    init(
        originalProduct: Product,
        originalPrice: Decimal?,
        candidateBarcodes: [String],
        loadProduct: LoadProductUseCase
    ) {
        self.originalProduct = originalProduct
        self.candidateBarcodes = candidateBarcodes
        self.loadProduct = loadProduct

        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        priceFormatter.locale = Locale(identifier: "pt_BR")
        priceFormatter.currencyCode = "BRL"
        originalPriceText = originalPrice.flatMap {
            priceFormatter.string(from: $0 as NSDecimalNumber)
        }
    }

    func loadCandidates() async {
        state = .loading
        onStateChange?(state)

        var candidates: [SubstitutionCandidate] = []
        var failedCount = 0

        for barcode in candidateBarcodes {
            guard !Task.isCancelled else { return }
            do {
                let product = try await loadProduct.execute(barcode: barcode)
                candidates.append(SubstitutionCandidate(product: product))
            } catch {
                guard !Task.isCancelled else { return }
                failedCount += 1
            }
        }

        if !candidates.isEmpty {
            state = .content(candidates, failedCount: failedCount)
        } else {
            state = failedCount == 0 ? .empty : .error
        }
        onStateChange?(state)
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
