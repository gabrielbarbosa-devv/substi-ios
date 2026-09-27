import Testing
@testable import Substi

struct LoadProductUseCaseTests {
    @Test
    func returnsProductLoadedByRepository() async throws {
        let expectedProduct = Product(
            id: ProductID(rawValue: "3017620422003"),
            name: "Creme de avelã",
            category: "Pasta",
            brand: "Marca exemplo",
            quantity: "350 g"
        )
        let useCase = LoadProductUseCase(
            productRepository: StubProductRepository(
                expectedBarcode: "3017620422003",
                result: .success(expectedProduct)
            )
        )

        let product = try await useCase.execute(barcode: "3017620422003")

        #expect(product.id == expectedProduct.id)
        #expect(product.name == expectedProduct.name)
    }

    @Test
    func propagatesRepositoryFailure() async throws {
        let useCase = LoadProductUseCase(
            productRepository: StubProductRepository(
                expectedBarcode: "3017620422003",
                result: .failure(.requestFailed)
            )
        )

        do {
            _ = try await useCase.execute(barcode: "3017620422003")
            Issue.record("Expected the repository error to propagate")
        } catch StubRepositoryError.requestFailed {
            return
        } catch {
            Issue.record("Expected StubRepositoryError.requestFailed, got \(error)")
        }
    }
}

private struct StubProductRepository: ProductRepository {
    let expectedBarcode: String
    let result: Result<Product, StubRepositoryError>

    func product(barcode: String) async throws -> Product {
        guard barcode == expectedBarcode else {
            throw StubRepositoryError.unexpectedBarcode
        }

        return try result.get()
    }
}

private enum StubRepositoryError: Error {
    case requestFailed
    case unexpectedBarcode
}
