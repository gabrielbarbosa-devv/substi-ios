import Foundation

public struct Product: Sendable {
    public let id: ProductID
    public let name: String
    public let category: String?
    public let brand: String?
    public let quantity: String?
    public let imageURL: URL?

    public init(
        id: ProductID,
        name: String,
        category: String?,
        brand: String?,
        quantity: String?,
        imageURL: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.brand = brand
        self.quantity = quantity
        self.imageURL = imageURL
    }
}
