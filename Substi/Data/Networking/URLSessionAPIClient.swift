import Foundation

struct URLSessionAPIClient: APIClient {
    private let baseURL: URL
    private let userAgent: String
    private let session: URLSession

    init(baseURL: URL, userAgent: String, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.userAgent = userAgent
        self.session = session
    }

    func data(for endpoint: Endpoint) async throws -> Data {
        guard let url = endpoint.url(relativeTo: baseURL) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")

        do {
            let (data, response) = try await session.data(for: request)

            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200..<300).contains(response.statusCode) else {
                AppLog.network.error("Catalog HTTP status: \(response.statusCode, privacy: .public)")
                throw NetworkError.httpStatusCode(response.statusCode)
            }

            return data
        } catch let error as URLError {
            AppLog.network.error("Catalog transport error: \(error.code.rawValue, privacy: .public)")
            throw NetworkError.transport(error)
        }
    }
}
