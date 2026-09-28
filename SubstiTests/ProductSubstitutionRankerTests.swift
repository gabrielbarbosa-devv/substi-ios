import SubstiDomain
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

    @Test func categoryMatchPrecedesQuantityMatch() {
        let original = product(id: "original", category: "en:dairies", quantity: "1 L")
        let quantityOnly = candidate(id: "quantity", category: "en:juices", quantity: "1 L")
        let categoryOnly = candidate(id: "category", category: "en:dairies", quantity: "500 ml")

        let ranked = ProductSubstitutionRanker().rank(
            [quantityOnly, categoryOnly],
            replacing: original
        )

        #expect(ranked.map(\.product.id.rawValue) == ["category", "quantity"])
    }

    @Test func quantityBreaksTiesWithinSameCategory() {
        let original = product(id: "original", category: "en:dairies", quantity: "1 L")
        let differentQuantity = candidate(id: "different", category: "en:dairies", quantity: "500 ml")
        let sameQuantity = candidate(id: "same", category: "EN:DAIRIES", quantity: " 1 l ")

        let ranked = ProductSubstitutionRanker().rank(
            [differentQuantity, sameQuantity],
            replacing: original
        )

        #expect(ranked.map(\.product.id.rawValue) == ["same", "different"])
    }

    @Test func quantityComparisonIgnoresWhitespaceAndLetterCase() {
        let original = product(id: "original", category: "en:dairies", quantity: "1 L")
        let equivalent = candidate(id: "equivalent", category: "en:dairies", quantity: "1l")

        #expect(
            ProductSubstitutionRanker().quantityScore(for: equivalent, replacing: original) == 1
        )
    }

    @Test func equalEvidenceKeepsCatalogOrder() {
        let original = product(id: "original", category: nil, quantity: nil)
        let first = candidate(id: "first", category: nil, quantity: nil)
        let second = candidate(id: "second", category: nil, quantity: nil)

        let ranked = ProductSubstitutionRanker().rank([first, second], replacing: original)

        #expect(ranked.map(\.product.id.rawValue) == ["first", "second"])
    }

    private func categoryScore(original: String?, candidate: String?) -> Int {
        let originalProduct = product(id: "original", category: original, quantity: nil)
        let substitutionCandidate = self.candidate(id: "candidate", category: candidate, quantity: nil)
        let ranker = ProductSubstitutionRanker()

        return ranker.categoryScore(for: substitutionCandidate, replacing: originalProduct)
    }

    private func candidate(id: String, category: String?, quantity: String?) -> SubstitutionCandidate {
        SubstitutionCandidate(product: product(id: id, category: category, quantity: quantity))
    }

    private func product(id: String, category: String?, quantity: String?) -> Product {
        Product(
            id: ProductID(rawValue: id),
            name: id,
            category: category,
            brand: nil,
            quantity: quantity
        )
    }
}
