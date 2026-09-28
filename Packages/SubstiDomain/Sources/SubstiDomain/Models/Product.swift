public struct Product: Sendable {
    public let id: ProductID
    public let name: String
    public let category: String?
    public let brand: String?
    public let quantity: String?

    public init(id: ProductID, name: String, category: String?, brand: String?, quantity: String?) {
        self.id = id
        self.name = name
        self.category = category
        self.brand = brand
        self.quantity = quantity
    }
}
