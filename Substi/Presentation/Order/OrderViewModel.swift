import Foundation

struct OrderViewModel {
    struct Item: Identifiable {
        enum Availability {
            case available
            case unavailable
        }

        let product: Product
        let availability: Availability

        var id: ProductID { product.id }
    }

    let items: [Item]

    init(order: Order, unavailableProductIDs: Set<ProductID>) {
        items = order.items.map { orderItem in
            Item(
                product: orderItem.product,
                availability: unavailableProductIDs.contains(orderItem.product.id)
                    ? .unavailable
                    : .available
            )
        }
    }

    var itemCountText: String {
        items.count == 1 ? "1 produto no pedido" : "\(items.count) produtos no pedido"
    }

    var firstUnavailableProductID: ProductID? {
        items.first(where: { $0.availability == .unavailable })?.id
    }
}
