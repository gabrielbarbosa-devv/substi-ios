protocol InventoryRepository {
    func currentOrder() -> Order
    func substitutionCandidates(for productID: ProductID) -> [SubstitutionCandidate]
    func confirmSubstitution(
        for originalProductID: ProductID,
        with candidate: SubstitutionCandidate
    ) -> Order?
}
