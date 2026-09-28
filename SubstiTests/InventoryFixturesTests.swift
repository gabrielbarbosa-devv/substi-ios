import SubstiDomain
import Testing
@testable import Substi

struct InventoryFixturesTests {
    @Test
    func demoOrderProvidesValidatedBarcodeCandidatesForMilk() throws {
        let repository = DemoInventoryRepository()
        let original = InventoryFixtures.unavailableProduct
        let barcodes = repository.substitutionCandidateBarcodes(for: InventoryFixtures.unavailableProduct.id)

        #expect(original.category == "en:dairies")
        #expect(original.quantity == "1 L")
        #expect(barcodes == ["7898215151708", "7898080640611", "7896051111016"])
        #expect(repository.unavailableProductIDs == [original.id])
    }

    @Test
    func fixtureReturnsNoCandidateBarcodesForUnknownProduct() {
        let repository = DemoInventoryRepository()

        #expect(repository.substitutionCandidateBarcodes(for: ProductID(rawValue: "unknown")).isEmpty)
    }
}
