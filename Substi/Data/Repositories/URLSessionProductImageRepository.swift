import Foundation
import SubstiDomain

enum ProductImageRepositoryError: Error {
    case unsupportedURL
    case invalidResponse
    case httpStatusCode(Int)
    case invalidContentType
    case emptyData
}

struct URLSessionProductImageRepository: ProductImageRepository {
    private static let allowedHosts: Set<String> = [
        "images.openfoodfacts.org",
        "static.openfoodfacts.org"
    ]

    private let session: URLSession
    private let userAgent: String

    init(
        userAgent: String = "Substi/1.0 (https://github.com/gabrielbarbosa-devv/substi-ios)",
        session: URLSession = .shared
    ) {
        self.userAgent = userAgent
        self.session = session
    }

    func imageData(for url: URL) async throws -> Data {
        guard Self.isAllowedImageURL(url) else {
            AppLog.images.error("Rejected product image URL with unsupported scheme or host")
            throw ProductImageRepositoryError.unsupportedURL
        }

        var request = URLRequest(url: url)
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        request.setValue("image/*", forHTTPHeaderField: "Accept")

        do {
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw ProductImageRepositoryError.invalidResponse
            }
            guard (200..<300).contains(response.statusCode) else {
                throw ProductImageRepositoryError.httpStatusCode(response.statusCode)
            }
            guard let finalURL = response.url else {
                throw ProductImageRepositoryError.invalidResponse
            }
            guard Self.isAllowedImageURL(finalURL) else {
                throw ProductImageRepositoryError.unsupportedURL
            }
            guard response.mimeType?.lowercased().hasPrefix("image/") == true else {
                throw ProductImageRepositoryError.invalidContentType
            }
            guard !data.isEmpty else {
                throw ProductImageRepositoryError.emptyData
            }
            return data
        } catch {
            if !Task.isCancelled && (error as? URLError)?.code != .cancelled {
                AppLog.images.error(
                    "Product image request failed: \(String(describing: error), privacy: .private)"
                )
            }
            throw error
        }
    }

    private static func isAllowedImageURL(_ url: URL) -> Bool {
        url.scheme?.lowercased() == "https"
            && url.host.map { allowedHosts.contains($0.lowercased()) } == true
    }
}
