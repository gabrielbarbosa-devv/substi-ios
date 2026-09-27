import Foundation
import Testing
@testable import Substi

@Suite(.serialized)
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

    @Test
    func urlSessionAPIClientSendsConfiguredRequestAndReturnsData() async throws {
        let expectedData = Data(
            """
            {"product":{"code":"123","product_name":"Leite integral","categories_tags":["en:dairies"],"brands":"Marca","quantity":"1 L"}}
            """.utf8
        )
        URLProtocolStub.handler.set { request in
            #expect(request.httpMethod == "GET")
            #expect(request.value(forHTTPHeaderField: "User-Agent") == "SubstiTest/1.0")
            #expect(request.url?.path == "/api/v3/product/123")

            let url = try #require(request.url)
            let response = try #require(HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            ))
            return (response, expectedData)
        }
        defer { URLProtocolStub.handler.reset() }

        let client = try makeAPIClient()
        let data = try await client.data(for: .openFoodFactsProduct(barcode: "123"))
        let response = try JSONDecoder().decode(OpenFoodFactsProductResponseDTO.self, from: data)
        let product = try OpenFoodFactsProductMapper().map(response)

        #expect(data == expectedData)
        #expect(product.id.rawValue == "123")
        #expect(product.name == "Leite integral")
        #expect(product.category == "en:dairies")
        #expect(product.brand == "Marca")
        #expect(product.quantity == "1 L")
    }

    @Test
    func urlSessionAPIClientRejectsNonSuccessStatusCodes() async throws {
        URLProtocolStub.handler.set { request in
            let url = try #require(request.url)
            let response = try #require(HTTPURLResponse(
                url: url,
                statusCode: 429,
                httpVersion: nil,
                headerFields: nil
            ))
            return (response, Data())
        }
        defer { URLProtocolStub.handler.reset() }

        let client = try makeAPIClient()
        do {
            _ = try await client.data(for: .openFoodFactsProduct(barcode: "123"))
            Issue.record("Expected the HTTP 429 response to be rejected")
        } catch let NetworkError.httpStatusCode(statusCode) {
            #expect(statusCode == 429)
        } catch {
            Issue.record("Expected NetworkError.httpStatusCode(429), got \(error)")
        }
    }

    @Test
    func productMapperRejectsMissingProductName() throws {
        let data = Data(#"{"product":{"code":"123"}}"#.utf8)
        let response = try JSONDecoder().decode(OpenFoodFactsProductResponseDTO.self, from: data)

        do {
            _ = try OpenFoodFactsProductMapper().map(response)
            Issue.record("Expected a product without a name to be rejected")
        } catch ProductMappingError.missingName {
            return
        } catch {
            Issue.record("Expected ProductMappingError.missingName, got \(error)")
        }
    }

    @Test
    func productMapperKeepsAbsentOptionalFieldsNil() throws {
        let data = Data(#"{"product":{"code":"123","product_name":"Leite"}}"#.utf8)
        let response = try JSONDecoder().decode(OpenFoodFactsProductResponseDTO.self, from: data)
        let product = try OpenFoodFactsProductMapper().map(response)

        #expect(product.category == nil)
        #expect(product.brand == nil)
        #expect(product.quantity == nil)
    }

    @Test
    func productMapperRejectsMissingProductCode() throws {
        let data = Data(#"{"product":{"product_name":"Leite"}}"#.utf8)
        let response = try JSONDecoder().decode(OpenFoodFactsProductResponseDTO.self, from: data)

        do {
            _ = try OpenFoodFactsProductMapper().map(response)
            Issue.record("Expected a product without a code to be rejected")
        } catch ProductMappingError.missingCode {
            return
        } catch {
            Issue.record("Expected ProductMappingError.missingCode, got \(error)")
        }
    }

    @Test
    func malformedJSONIsRejectedByDecoder() {
        let data = Data("{not-json}".utf8)

        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(OpenFoodFactsProductResponseDTO.self, from: data)
        }
    }

    @Test
    func urlSessionAPIClientMapsTransportFailure() async throws {
        URLProtocolStub.handler.set { _ in
            throw URLError(.notConnectedToInternet)
        }
        defer { URLProtocolStub.handler.reset() }

        let client = try makeAPIClient()
        do {
            _ = try await client.data(for: .openFoodFactsProduct(barcode: "123"))
            Issue.record("Expected the simulated transport failure to be propagated")
        } catch let NetworkError.transport(error) {
            #expect(error.code == .notConnectedToInternet)
        } catch {
            Issue.record("Expected NetworkError.transport, got \(error)")
        }
    }

    private func makeAPIClient() throws -> URLSessionAPIClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: configuration)
        let baseURL = try #require(URL(string: "https://world.openfoodfacts.org"))

        return URLSessionAPIClient(
            baseURL: baseURL,
            userAgent: "SubstiTest/1.0",
            session: session
        )
    }
}

private final class URLProtocolStub: URLProtocol {
    static let handler = URLProtocolStubHandler()

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        do {
            let (response, data) = try Self.handler.handle(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private final class URLProtocolStubHandler: @unchecked Sendable {
    private let lock = NSLock()
    private var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    func set(_ handler: @escaping (URLRequest) throws -> (HTTPURLResponse, Data)) {
        lock.lock()
        defer { lock.unlock() }
        requestHandler = handler
    }

    func reset() {
        lock.lock()
        defer { lock.unlock() }
        requestHandler = nil
    }

    func handle(_ request: URLRequest) throws -> (HTTPURLResponse, Data) {
        lock.lock()
        let handler = requestHandler
        lock.unlock()

        guard let handler else {
            throw URLError(.badServerResponse)
        }
        return try handler(request)
    }
}
