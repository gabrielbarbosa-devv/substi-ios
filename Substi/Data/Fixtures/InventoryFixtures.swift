enum InventoryFixtures {
    static let unavailableProduct = Product(
        id: ProductID(rawValue: "substi-demo-milk-original"),
        name: "Leite integral",
        category: "en:dairies",
        brand: "Marca do pedido",
        quantity: "1 L"
    )

    static let order = Order(items: [OrderItem(product: unavailableProduct)])

    private static let firstCandidate = SubstitutionCandidate(
        product: Product(
            id: ProductID(rawValue: "substi-demo-milk-candidate-1"),
            name: "Leite integral",
            category: "en:dairies",
            brand: "Vale Verde",
            quantity: "1 L"
        )
    )

    private static let secondCandidate = SubstitutionCandidate(
        product: Product(
            id: ProductID(rawValue: "substi-demo-milk-candidate-2"),
            name: "Leite integral",
            category: "en:dairies",
            brand: "Campo Claro",
            quantity: "1 L"
        )
    )

    static let substitutionCandidates: [ProductID: [SubstitutionCandidate]] = [
        ProductID(rawValue: "substi-demo-milk-original"): [firstCandidate, secondCandidate]
    ]
}
