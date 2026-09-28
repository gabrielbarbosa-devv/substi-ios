final class DemoInventoryRepository: InventoryRepository {
    private var order = InventoryFixtures.order

    func currentOrder() -> Order {
        order
    }

    func substitutionCandidates(for productID: ProductID) -> [SubstitutionCandidate] {
        InventoryFixtures.substitutionCandidates[productID] ?? []
    }

    func confirmSubstitution(
        for originalProductID: ProductID,
        with candidate: SubstitutionCandidate
    ) -> Order? {
        guard
            InventoryFixtures.substitutionCandidates[originalProductID]?.contains(where: {
                $0.product.id == candidate.product.id
            }) == true,
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
