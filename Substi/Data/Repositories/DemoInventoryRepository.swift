import SubstiDomain
final class DemoInventoryRepository: InventoryRepository {
    private var order = InventoryFixtures.order

    var unavailableProductIDs: Set<ProductID> {
        InventoryFixtures.unavailableProductIDs
    }

    func currentOrder() -> Order {
        order
    }

    func substitutionCandidateBarcodes(for productID: ProductID) -> [String] {
        InventoryFixtures.substitutionCandidateBarcodes[productID] ?? []
    }

    func saveOrder(_ order: Order) {
        self.order = order
    }
}
