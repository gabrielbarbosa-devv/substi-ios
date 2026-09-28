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

    func confirmSubstitution(
        for originalProductID: ProductID,
        with candidate: SubstitutionCandidate
    ) -> Order? {
        guard
            InventoryFixtures.substitutionCandidateBarcodes[originalProductID]?.contains(
                candidate.product.id.rawValue
            ) == true,
            let itemIndex = order.items.firstIndex(where: { $0.product.id == originalProductID })
        else {
            return nil
        }

        let originalProduct = order.items[itemIndex].product
        var updatedItems = order.items
        updatedItems[itemIndex] = OrderItem(
            product: candidate.product,
            substitutedFrom: originalProduct
        )
        order = Order(items: updatedItems)
        return order
    }
}
