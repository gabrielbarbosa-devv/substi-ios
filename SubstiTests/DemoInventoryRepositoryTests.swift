import SubstiDomain
import Testing
@testable import Substi

struct DemoInventoryRepositoryTests {
    @Test
    func confirmingConfiguredCandidateUpdatesOnlyUnavailableItem() {
        let repository = DemoInventoryRepository()
        let originalID = InventoryFixtures.unavailableProduct.id
        guard let barcode = InventoryFixtures.substitutionCandidateBarcodes[originalID]?.first else {
            Issue.record("A fixture precisa conter ao menos um candidato.")
            return
        }
        let candidate = SubstitutionCandidate(product: Product(
            id: ProductID(rawValue: barcode),
            name: "Leite Integral",
            category: "en:dairies",
            brand: "Marca B",
            quantity: "1 L"
        ))

        let updatedOrder = repository.confirmSubstitution(for: originalID, with: candidate)

        #expect(updatedOrder?.items.count == 3)
        #expect(updatedOrder?.items[0].product.id == InventoryFixtures.availableBanana.id)
        #expect(updatedOrder?.items[1].product.id == candidate.product.id)
        #expect(updatedOrder?.items[1].substitutedFrom?.id == originalID)
        #expect(repository.currentOrder().items[1].product.id == candidate.product.id)
    }

    @Test
    func rejectsCandidateOutsideConfiguredCatalog() {
        let repository = DemoInventoryRepository()
        let originalID = InventoryFixtures.unavailableProduct.id
        let candidate = SubstitutionCandidate(product: Product(
            id: ProductID(rawValue: "unknown"),
            name: "Outro produto",
            category: nil,
            brand: nil,
            quantity: nil
        ))

        #expect(repository.confirmSubstitution(for: originalID, with: candidate) == nil)
        #expect(repository.currentOrder().items[1].product.id == originalID)
    }
}
