import Foundation

struct OrderItem {
    let product: Product
    let price: Decimal?
    let substitutedFrom: Product?

    init(product: Product, price: Decimal? = nil, substitutedFrom: Product? = nil) {
        self.product = product
        self.price = price
        self.substitutedFrom = substitutedFrom
    }
}
