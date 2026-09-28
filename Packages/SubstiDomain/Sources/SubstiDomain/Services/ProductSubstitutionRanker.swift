import Foundation

public struct ProductSubstitutionRanker {
    public init() {}

    public func rank(
        _ candidates: [SubstitutionCandidate],
        replacing original: Product
    ) -> [SubstitutionCandidate] {
        candidates.enumerated().sorted { left, right in
            let leftCategory = categoryScore(for: left.element, replacing: original)
            let rightCategory = categoryScore(for: right.element, replacing: original)
            if leftCategory != rightCategory { return leftCategory > rightCategory }

            let leftQuantity = quantityScore(for: left.element, replacing: original)
            let rightQuantity = quantityScore(for: right.element, replacing: original)
            if leftQuantity != rightQuantity { return leftQuantity > rightQuantity }

            return left.offset < right.offset
        }.map(\.element)
    }

    public func categoryScore(for candidate: SubstitutionCandidate, replacing original: Product) -> Int {
        guard
            let originalCategory = original.category,
            let candidateCategory = candidate.product.category
        else {
            return 0
        }

        return normalized(originalCategory) == normalized(candidateCategory) ? 1 : 0
    }

    public func quantityScore(for candidate: SubstitutionCandidate, replacing original: Product) -> Int {
        guard
            let originalQuantity = original.quantity,
            let candidateQuantity = candidate.product.quantity
        else {
            return 0
        }

        return normalized(originalQuantity) == normalized(candidateQuantity) ? 1 : 0
    }

    private func normalized(_ value: String) -> String {
        value.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
}
