import SubstiDomain

@MainActor
struct ConfirmSubstitutionUseCase {
    private let inventoryRepository: any InventoryRepository

    init(inventoryRepository: any InventoryRepository) {
        self.inventoryRepository = inventoryRepository
    }

    func execute(
        for originalProductID: ProductID,
        with candidate: SubstitutionCandidate
    ) -> Order? {
        let currentOrder = inventoryRepository.currentOrder()
        guard
            inventoryRepository.substitutionCandidateBarcodes(for: originalProductID)
                .contains(candidate.product.id.rawValue),
            let itemIndex = currentOrder.items.firstIndex(where: {
                $0.product.id == originalProductID
            })
        else {
            return nil
        }

        let originalProduct = currentOrder.items[itemIndex].product
        var updatedItems = currentOrder.items
        updatedItems[itemIndex] = OrderItem(
            product: candidate.product,
            substitutedFrom: originalProduct
        )

        let updatedOrder = Order(items: updatedItems)
        inventoryRepository.saveOrder(updatedOrder)
        return updatedOrder
    }
}
