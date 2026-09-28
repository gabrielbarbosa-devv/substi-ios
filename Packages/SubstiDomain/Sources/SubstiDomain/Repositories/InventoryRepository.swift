public protocol InventoryRepository {
    var unavailableProductIDs: Set<ProductID> { get }

    func currentOrder() -> Order
    func substitutionCandidateBarcodes(for productID: ProductID) -> [String]
    func saveOrder(_ order: Order)
}
