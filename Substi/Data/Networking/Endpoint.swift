import Foundation

struct Endpoint {
    let path: String
    let method: HTTPMethod
    let queryItems: [URLQueryItem]

    init(path: String, method: HTTPMethod, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
    }

    func url(relativeTo baseURL: URL) -> URL? {
        guard var components = URLComponents(
            url: baseURL,
            resolvingAgainstBaseURL: false
        ) else {
            return nil
        }

        components.path = "/" + path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        return components.url
    }

    static func openFoodFactsProduct(barcode: String) -> Endpoint {
        Endpoint(
            path: "api/v3/product/\(barcode)",
            method: .get,
            queryItems: [
                URLQueryItem(name: "fields", value: "code,product_name,categories_tags,brands,quantity")
            ]
        )
    }
}
