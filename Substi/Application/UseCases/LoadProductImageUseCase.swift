import Foundation
import SubstiDomain

struct LoadProductImageUseCase: Sendable {
    private let repository: any ProductImageRepository

    init(repository: any ProductImageRepository) {
        self.repository = repository
    }

    func execute(for url: URL) async throws -> Data {
        try await repository.imageData(for: url)
    }
}
