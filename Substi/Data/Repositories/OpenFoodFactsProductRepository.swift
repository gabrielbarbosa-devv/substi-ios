import SubstiDomain
import Foundation

struct OpenFoodFactsProductRepository: ProductRepository {
    private let apiClient: any APIClient
    private let mapper: OpenFoodFactsProductMapper

    init(
        apiClient: any APIClient,
        mapper: OpenFoodFactsProductMapper = OpenFoodFactsProductMapper()
    ) {
        self.apiClient = apiClient
        self.mapper = mapper
    }

    func product(barcode: String) async throws -> Product {
        let data = try await apiClient.data(
            for: .openFoodFactsProduct(barcode: barcode)
        )
        let response = try JSONDecoder().decode(
            OpenFoodFactsProductResponseDTO.self,
            from: data
        )

        return try mapper.map(response)
    }
}
