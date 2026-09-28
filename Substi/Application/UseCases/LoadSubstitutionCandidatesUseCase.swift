import SubstiDomain

struct LoadSubstitutionCandidatesUseCase: Sendable {
    enum Outcome: Sendable {
        case loaded(candidates: [SubstitutionCandidate], failedCount: Int)
        case empty
        case failed(failedCount: Int)
        case cancelled
    }

    private let productRepository: any ProductRepository
    private let ranker: ProductSubstitutionRanker

    init(
        productRepository: any ProductRepository,
        ranker: ProductSubstitutionRanker = ProductSubstitutionRanker()
    ) {
        self.productRepository = productRepository
        self.ranker = ranker
    }

    func execute(
        originalProduct: Product,
        candidateBarcodes: [String]
    ) async -> Outcome {
        guard !candidateBarcodes.isEmpty else { return .empty }

        var candidates: [SubstitutionCandidate] = []
        var failedCount = 0

        for barcode in candidateBarcodes {
            guard !Task.isCancelled else { return .cancelled }

            do {
                let product = try await productRepository.product(barcode: barcode)
                guard !Task.isCancelled else { return .cancelled }
                candidates.append(SubstitutionCandidate(product: product))
            } catch {
                guard !Task.isCancelled else { return .cancelled }
                failedCount += 1
                AppLog.suggestions.error(
                    "Candidate lookup failed: \(String(describing: error), privacy: .private)"
                )
            }
        }

        guard !Task.isCancelled else { return .cancelled }
        guard !candidates.isEmpty else { return .failed(failedCount: failedCount) }

        return .loaded(
            candidates: ranker.rank(candidates, replacing: originalProduct),
            failedCount: failedCount
        )
    }
}
