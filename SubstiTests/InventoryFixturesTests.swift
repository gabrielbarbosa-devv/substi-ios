import Testing
@testable import Substi

struct InventoryFixturesTests {
    @Test
    func demoOrderHasMilkWithTwoComparableSubstitutes() throws {
        let repository = DemoInventoryRepository()
        let original = try #require(repository.currentOrder().items.first?.product)
        let candidates = repository.substitutionCandidates(for: original.id)

        #expect(original.category == "en:dairies")
        #expect(original.quantity == "1 L")
        #expect(candidates.count == 2)
        #expect(candidates.allSatisfy { $0.product.category == original.category })
        #expect(candidates.allSatisfy { $0.product.quantity == original.quantity })
        #expect(candidates.allSatisfy { $0.product.brand != original.brand })
    }

    @Test
    func fixtureReturnsNoCandidatesForUnknownProduct() {
        let repository = DemoInventoryRepository()

        #expect(repository.substitutionCandidates(for: ProductID(rawValue: "unknown")).isEmpty)
    }
}
