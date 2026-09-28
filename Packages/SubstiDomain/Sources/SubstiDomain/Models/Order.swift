public struct Order: Sendable {
    public let items: [OrderItem]

    public init(items: [OrderItem]) {
        self.items = items
    }
}
