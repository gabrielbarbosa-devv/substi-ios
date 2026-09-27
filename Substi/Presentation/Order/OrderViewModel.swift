import Foundation

struct OrderViewModel {
    struct Item: Identifiable {
        enum Availability {
            case available
            case unavailable
        }

        let product: Product
        let availability: Availability
        let priceText: String?

        var id: ProductID { product.id }
    }

    let items: [Item]

    init(order: Order, unavailableProductIDs: Set<ProductID>) {
        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        priceFormatter.locale = Locale(identifier: "pt_BR")
        priceFormatter.currencyCode = "BRL"

        items = order.items.map { orderItem in
            Item(
                product: orderItem.product,
                availability: unavailableProductIDs.contains(orderItem.product.id)
                    ? .unavailable
                    : .available,
                priceText: orderItem.price.flatMap {
                    priceFormatter.string(from: $0 as NSDecimalNumber)
                }
            )
        }
    }

    var itemCountText: String {
        items.count == 1 ? "1 produto no pedido" : "\(items.count) produtos no pedido"
    }

    var unavailableItemCount: Int {
        items.filter { $0.availability == .unavailable }.count
    }

    var firstUnavailableProductID: ProductID? {
        items.first(where: { $0.availability == .unavailable })?.id
    }
}
