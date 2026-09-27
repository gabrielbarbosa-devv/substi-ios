import Foundation

protocol APIClient: Sendable {
    func data(for endpoint: Endpoint) async throws -> Data
}
