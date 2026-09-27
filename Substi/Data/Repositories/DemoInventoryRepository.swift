struct DemoInventoryRepository: InventoryRepository {
    func currentOrder() -> Order {
        InventoryFixtures.order
    }

    func substitutionCandidates(for productID: ProductID) -> [SubstitutionCandidate] {
        InventoryFixtures.substitutionCandidates[productID] ?? []
    }
}
