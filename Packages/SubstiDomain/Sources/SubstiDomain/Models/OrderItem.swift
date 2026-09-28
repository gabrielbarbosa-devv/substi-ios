import Foundation

public struct OrderItem: Sendable {
    public let product: Product
    public let price: Decimal?
    public let substitutedFrom: Product?

    public init(product: Product, price: Decimal? = nil, substitutedFrom: Product? = nil) {
        self.product = product
        self.price = price
        self.substitutedFrom = substitutedFrom
    }
}
