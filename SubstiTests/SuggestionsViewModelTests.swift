import SubstiDomain
import Testing
@testable import Substi

@MainActor
struct SuggestionsViewModelTests {
    @Test
    func loadsRealCatalogProductsThroughInjectedRepository() async throws {
        let repository = FixtureProductRepository(productsByBarcode: [
            "111": product(id: "111", name: "Leite A"),
            "222": product(id: "222", name: "Leite B")
        ])
        let viewModel = makeViewModel(repository: repository, barcodes: ["111", "222"])

        await viewModel.loadCandidates()

        #expect(viewModel.candidates.map { $0.product.name } == ["Leite A", "Leite B"])
        if case let .content(_, failedCount) = viewModel.state {
            #expect(failedCount == 0)
        } else {
            Issue.record("Expected loaded candidates")
        }
    }

    @Test
    func keepsSuccessfulCandidatesWhenOneRequestFails() async throws {
        let repository = FixtureProductRepository(productsByBarcode: [
            "111": product(id: "111", name: "Leite A")
        ])
        let viewModel = makeViewModel(repository: repository, barcodes: ["111", "missing"])

        await viewModel.loadCandidates()

        #expect(viewModel.candidates.count == 1)
        if case let .content(_, failedCount) = viewModel.state {
            #expect(failedCount == 1)
        } else {
            Issue.record("Expected partial content state")
        }
    }

    @Test
    func ordersLoadedCandidatesByCategoryThenQuantity() async {
        let repository = FixtureProductRepository(productsByBarcode: [
            "different": Product(
                id: ProductID(rawValue: "different"),
                name: "Suco",
                category: "en:juices",
                brand: nil,
                quantity: "1 L"
            ),
            "matching": product(id: "matching", name: "Leite")
        ])
        let viewModel = makeViewModel(repository: repository, barcodes: ["different", "matching"])

        await viewModel.loadCandidates()

        #expect(viewModel.candidates.map(\.product.id.rawValue) == ["matching", "different"])
    }

    @Test
    func reportsErrorWhenEveryRequestFails() async {
        let viewModel = makeViewModel(repository: FixtureProductRepository(productsByBarcode: [:]), barcodes: ["missing"])

        await viewModel.loadCandidates()

        if case .error = viewModel.state {
            return
        }
        Issue.record("Expected an error state")
    }

    @Test
    func reportsEmptyWhenNoBarcodesAreConfigured() async {
        let viewModel = makeViewModel(repository: FixtureProductRepository(productsByBarcode: [:]), barcodes: [])

        await viewModel.loadCandidates()

        if case .empty = viewModel.state {
            return
        }
        Issue.record("Expected an empty state")
    }

    private func makeViewModel(repository: FixtureProductRepository, barcodes: [String]) -> SuggestionsViewModel {
        SuggestionsViewModel(
            originalProduct: product(id: "original", name: "Leite original"),
            originalPrice: nil,
            candidateBarcodes: barcodes,
            loadProduct: LoadProductUseCase(productRepository: repository)
        )
    }

    private func product(id: String, name: String) -> Product {
        Product(
            id: ProductID(rawValue: id),
            name: name,
            category: "en:dairies",
            brand: "Marca",
            quantity: "1 L"
        )
    }
}

private struct FixtureProductRepository: ProductRepository {
    let productsByBarcode: [String: Product]

    func product(barcode: String) async throws -> Product {
        guard let product = productsByBarcode[barcode] else {
            throw ProductRepositoryTestError.notFound
        }
        return product
    }
}

private enum ProductRepositoryTestError: Error {
    case notFound
}
