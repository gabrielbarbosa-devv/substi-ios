struct ProductSubstitutionRanker {
    func categoryScore(for candidate: SubstitutionCandidate, replacing original: Product) -> Int {
        guard
            let originalCategory = original.category,
            let candidateCategory = candidate.product.category
        else {
            return 0
        }

        return originalCategory.lowercased() == candidateCategory.lowercased() ? 1 : 0
    }
}
