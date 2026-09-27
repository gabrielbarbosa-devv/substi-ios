import Foundation
import Testing
@testable import Substi

struct NetworkingPrimitivesTests {
    @Test
    func openFoodFactsProductEndpointBuildsBarcodeURL() throws {
        let endpoint = Endpoint.openFoodFactsProduct(barcode: "3017620422003")
        let baseURL = try #require(URL(string: "https://world.openfoodfacts.org"))

        #expect(endpoint.url(relativeTo: baseURL)?.absoluteString ==
            "https://world.openfoodfacts.org/api/v3/product/3017620422003")
        #expect(endpoint.method == .get)
    }

    @Test
    func endpointEncodesQueryItems() throws {
        let endpoint = Endpoint(
            path: "/api/v3/product/3017620422003",
            method: .get,
            queryItems: [URLQueryItem(name: "fields", value: "code,product_name")]
        )
        let baseURL = try #require(URL(string: "https://world.openfoodfacts.org"))

        #expect(endpoint.url(relativeTo: baseURL)?.absoluteString ==
            "https://world.openfoodfacts.org/api/v3/product/3017620422003?fields=code,product_name")
    }

    @Test
    func getMethodUsesHTTPWireValue() {
        #expect(HTTPMethod.get.rawValue == "GET")
    }
}
