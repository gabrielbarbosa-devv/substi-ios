protocol InventoryRepository {
    func currentOrder() -> Order
    func substitutionCandidateBarcodes(for productID: ProductID) -> [String]
    func confirmSubstitution(
        for originalProductID: ProductID,
        with candidate: SubstitutionCandidate
    ) -> Order?
}
