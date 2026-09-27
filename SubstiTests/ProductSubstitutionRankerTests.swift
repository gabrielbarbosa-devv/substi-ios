import Testing
@testable import Substi

struct ProductSubstitutionRankerTests {
    @Test func matchingCategoriesReceiveOnePoint() {
        #expect(categoryScore(original: "Dairy", candidate: "Dairy") == 1)
    }

    @Test func categoryComparisonIgnoresLetterCase() {
        #expect(categoryScore(original: "DAIRY", candidate: "dairy") == 1)
    }

    @Test func differentCategoriesReceiveZeroPoints() {
        #expect(categoryScore(original: "Dairy", candidate: "Bakery") == 0)
    }

    @Test func missingOriginalCategoryReceivesZeroPoints() {
        #expect(categoryScore(original: nil, candidate: "Dairy") == 0)
    }

    @Test func missingCandidateCategoryReceivesZeroPoints() {
        #expect(categoryScore(original: "Dairy", candidate: nil) == 0)
    }

    private func categoryScore(original: String?, candidate: String?) -> Int {
        let originalProduct = Product(
            id: ProductID(rawValue: "original"),
            name: "Original product",
            category: original,
            brand: nil,
            quantity: nil
        )
        let candidateProduct = Product(
            id: ProductID(rawValue: "candidate"),
            name: "Candidate product",
            category: candidate,
            brand: nil,
            quantity: nil
        )
        let substitutionCandidate = SubstitutionCandidate(product: candidateProduct)
        let ranker = ProductSubstitutionRanker()

        return ranker.categoryScore(for: substitutionCandidate, replacing: originalProduct)
    }
}
