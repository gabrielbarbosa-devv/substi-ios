import SubstiDomain
import Testing
@testable import Substi

@MainActor
struct ConfirmSubstitutionUseCaseTests {
    @Test
    func replacesOnlyTheUnavailableOrderItemAndPersistsTheResult() {
        let repository = DemoInventoryRepository()
        let useCase = ConfirmSubstitutionUseCase(inventoryRepository: repository)
        let originalID = InventoryFixtures.unavailableProduct.id
        let candidate = makeCandidate(barcode: "7898215151708")

        let updatedOrder = useCase.execute(for: originalID, with: candidate)

        #expect(updatedOrder?.items.count == 3)
        #expect(updatedOrder?.items[0].product.id == InventoryFixtures.availableBanana.id)
        #expect(updatedOrder?.items[1].product.id == candidate.product.id)
        #expect(updatedOrder?.items[1].substitutedFrom?.id == originalID)
        #expect(repository.currentOrder().items[1].product.id == candidate.product.id)
    }

    @Test
    func rejectsCandidateOutsideConfiguredOptionsWithoutChangingOrder() {
        let repository = DemoInventoryRepository()
        let useCase = ConfirmSubstitutionUseCase(inventoryRepository: repository)
        let originalID = InventoryFixtures.unavailableProduct.id
        let originalOrder = repository.currentOrder()

        let result = useCase.execute(
            for: originalID,
            with: makeCandidate(barcode: "unknown")
        )

        #expect(result == nil)
        #expect(repository.currentOrder().items[1].product.id == originalOrder.items[1].product.id)
    }

    private func makeCandidate(barcode: String) -> SubstitutionCandidate {
        SubstitutionCandidate(product: Product(
            id: ProductID(rawValue: barcode),
            name: "Leite Integral",
            category: "en:dairies",
            brand: "Marca B",
            quantity: "1 L"
        ))
    }
}

@MainActor
struct DemoInventoryRepositoryTests {
    @Test
    func savesUpdatedOrder() {
        let repository = DemoInventoryRepository()
        let order = repository.currentOrder()
        let updatedOrder = Order(items: Array(order.items.dropLast()))

        repository.saveOrder(updatedOrder)

        #expect(repository.currentOrder().items.count == 2)
    }
}
