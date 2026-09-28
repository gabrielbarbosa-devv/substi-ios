public protocol ProductRepository: Sendable {
    func product(barcode: String) async throws -> Product
}
