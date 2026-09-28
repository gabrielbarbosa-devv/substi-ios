import SubstiDomain
struct LoadProductUseCase: Sendable {
    private let productRepository: any ProductRepository

    init(productRepository: any ProductRepository) {
        self.productRepository = productRepository
    }

    func execute(barcode: String) async throws -> Product {
        try await productRepository.product(barcode: barcode)
    }
}
