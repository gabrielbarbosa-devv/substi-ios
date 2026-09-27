import Testing
@testable import Substi

struct InventoryFixturesTests {
    @Test
    func demoOrderHasMilkWithTwoComparableSubstitutes() throws {
        let original = try #require(InventoryFixtures.order.items.first?.product)
        let candidates = try #require(InventoryFixtures.substitutionCandidates[original.id])

        #expect(original.category == "en:dairies")
        #expect(original.quantity == "1 L")
        #expect(candidates.count == 2)
        #expect(candidates.allSatisfy { $0.product.category == original.category })
        #expect(candidates.allSatisfy { $0.product.quantity == original.quantity })
        #expect(candidates.allSatisfy { $0.product.brand != original.brand })
    }

    @Test
    func fixtureReturnsNoCandidatesForUnknownProduct() {
        #expect(!InventoryFixtures.substitutionCandidates.keys.contains(ProductID(rawValue: "unknown")))
    }
}
