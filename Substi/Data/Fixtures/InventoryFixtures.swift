import Foundation

enum InventoryFixtures {
    static let availableBanana = Product(
        id: ProductID(rawValue: "substi-demo-banana"),
        name: "Banana Nanica",
        category: "en:fruits",
        brand: nil,
        quantity: "1 kg"
    )

    static let unavailableProduct = Product(
        id: ProductID(rawValue: "substi-demo-milk-original"),
        name: "Leite Integral",
        category: "en:dairies",
        brand: "Marca A",
        quantity: "1 L"
    )

    static let availableEggs = Product(
        id: ProductID(rawValue: "substi-demo-eggs"),
        name: "Ovos Brancos",
        category: "en:eggs",
        brand: nil,
        quantity: "12 un"
    )

    static let order = Order(items: [
        OrderItem(product: availableBanana, price: Decimal(499) / Decimal(100)),
        OrderItem(product: unavailableProduct, price: Decimal(799) / Decimal(100)),
        OrderItem(product: availableEggs, price: Decimal(1290) / Decimal(100))
    ])

    static let unavailableProductIDs: Set<ProductID> = [unavailableProduct.id]

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
