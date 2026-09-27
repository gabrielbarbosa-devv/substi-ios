import Foundation

struct OrderItem {
    let product: Product
    let price: Decimal?

    init(product: Product, price: Decimal? = nil) {
        self.product = product
        self.price = price
    }
}
