#if DEBUG
import SubstiDomain

struct DemoCatalogProductRepository: ProductRepository {
    private let productsByBarcode: [String: Product] = [
        "7898215151708": Product(
            id: ProductID(rawValue: "7898215151708"),
            name: "Leite Integral",
            category: "en:dairies",
            brand: "Marca B",
            quantity: "1 L"
        ),
        "7898080640611": Product(
            id: ProductID(rawValue: "7898080640611"),
            name: "Leite Semidesnatado",
            category: "en:dairies",
            brand: "Marca C",
            quantity: "1 L"
        ),
        "7896051111016": Product(
            id: ProductID(rawValue: "7896051111016"),
            name: "Leite Integral",
            category: "en:dairies",
            brand: "Marca D",
            quantity: "500 ml"
        )
    ]

    func product(barcode: String) async throws -> Product {
        guard let product = productsByBarcode[barcode] else {
            throw DemoCatalogError.productNotFound
        }
        return product
    }
}

private enum DemoCatalogError: Error {
    case productNotFound
}
#endif
