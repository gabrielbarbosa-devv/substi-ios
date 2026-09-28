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
        let response: OpenFoodFactsProductResponseDTO
        do {
            response = try JSONDecoder().decode(
                OpenFoodFactsProductResponseDTO.self,
                from: data
            )
        } catch {
            AppLog.network.error(
                "Catalog response decoding failed: \(String(describing: error), privacy: .private)"
            )
            throw error
        }

        do {
            return try mapper.map(response)
        } catch {
            AppLog.network.error(
                "Catalog product mapping failed: \(String(describing: error), privacy: .private)"
            )
            throw error
        }
    }
}
