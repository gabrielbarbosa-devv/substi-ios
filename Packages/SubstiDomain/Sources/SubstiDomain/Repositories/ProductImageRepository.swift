import Foundation

public protocol ProductImageRepository: Sendable {
    func imageData(for url: URL) async throws -> Data
}
