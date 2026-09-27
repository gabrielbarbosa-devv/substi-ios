protocol ProductRepository {
    func product(barcode: String) async throws -> Product
}
