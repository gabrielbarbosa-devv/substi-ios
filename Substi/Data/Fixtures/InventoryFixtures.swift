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

    // GTINs were queried against the Open Food Facts v3 product endpoint on 2026-09-27.
    static let substitutionCandidateBarcodes: [ProductID: [String]] = [
        ProductID(rawValue: "substi-demo-milk-original"): [
            "7898215151708", // Piracanjuba, whole milk, 1 L
            "7898080640611", // Italac, whole milk, 1 L
            "7896051111016" // Itambé, whole milk, 1 L
        ]
    ]
}
