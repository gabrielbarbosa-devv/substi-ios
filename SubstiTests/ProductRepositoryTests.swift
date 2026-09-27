import Foundation
import Testing
@testable import Substi

struct ProductRepositoryTests {
    @Test
    func mapsAPIResponseIntoDomainProduct() async throws {
        let response = Data(
            #"{"product":{"code":"3017620422003","product_name":"Creme de avelã","categories_tags":["en:spreads"],"brands":"Marca exemplo","quantity":"350 g"}}"#.utf8
        )
        let repository = OpenFoodFactsProductRepository(
            apiClient: StubAPIClient(responseData: response)
        )

        let product = try await repository.product(barcode: "3017620422003")

        #expect(product.id.rawValue == "3017620422003")
        #expect(product.name == "Creme de avelã")
        #expect(product.category == "en:spreads")
        #expect(product.brand == "Marca exemplo")
        #expect(product.quantity == "350 g")
    }

    @Test
    func propagatesMappingErrorForProductWithoutName() async throws {
        let response = Data(#"{"product":{"code":"123"}}"#.utf8)
        let repository = OpenFoodFactsProductRepository(
            apiClient: StubAPIClient(responseData: response)
        )

        do {
            _ = try await repository.product(barcode: "123")
            Issue.record("Expected a product without a name to be rejected")
        } catch ProductMappingError.missingName {
            return
        } catch {
            Issue.record("Expected ProductMappingError.missingName, got \(error)")
        }
    }
}

private struct StubAPIClient: APIClient {
    let responseData: Data

    func data(for endpoint: Endpoint) async throws -> Data {
        responseData
    }
}
