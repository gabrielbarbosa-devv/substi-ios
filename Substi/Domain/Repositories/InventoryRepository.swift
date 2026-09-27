protocol InventoryRepository {
    func currentOrder() -> Order
    func substitutionCandidates(for productID: ProductID) -> [SubstitutionCandidate]
}
