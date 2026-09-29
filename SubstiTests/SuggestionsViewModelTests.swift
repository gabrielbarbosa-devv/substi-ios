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

    @Test
    func retryLoadsCandidatesAgainAfterFailure() async {
        let repository = FailOnceProductRepository(product: product(id: "111", name: "Leite A"))
        let viewModel = makeViewModel(repository: repository, barcodes: ["111"])

        await viewModel.loadCandidates()
        if case .error = viewModel.state {
            // The first request intentionally fails so this test can verify the retry path.
        } else {
            Issue.record("Expected the first request to fail")
            return
        }

        await viewModel.loadCandidates()

        #expect(viewModel.candidates.map(\.product.id.rawValue) == ["111"])
        #expect(await repository.requestCount == 2)
    }

    @Test
    func cancelledLoadReturnsToIdle() async {
        let viewModel = makeViewModel(
            repository: SlowProductRepository(),
            barcodes: ["111"]
        )
        let task = Task { await viewModel.loadCandidates() }

        while !isLoading(viewModel) {
            await Task.yield()
        }
        task.cancel()
        await task.value

        if case .idle = viewModel.state {
            return
        }
        Issue.record("A cancelled request should not leave the screen in a loading state")
    }

    private func makeViewModel(
        repository: any ProductRepository,
        barcodes: [String]
    ) -> SuggestionsViewModel {
        let originalProduct = product(id: "original", name: "Leite original")
        let inventoryRepository = FixtureInventoryRepository(
            order: Order(items: [OrderItem(product: originalProduct)]),
            candidateBarcodes: barcodes
        )
        guard let viewModel = SuggestionsViewModel(
            productID: originalProduct.id,
            inventoryRepository: inventoryRepository,
            loadCandidates: LoadSubstitutionCandidatesUseCase(productRepository: repository)
        ) else {
            Issue.record("Expected the original product in the fixture order")
            fatalError("Test fixture must contain the original product")
        }
        return viewModel
    }

    private func isLoading(_ viewModel: SuggestionsViewModel) -> Bool {
        if case .loading = viewModel.state { return true }
        return false
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

private final class FixtureInventoryRepository: InventoryRepository {
    private var order: Order
    private let candidateBarcodes: [String]

    var unavailableProductIDs: Set<ProductID> { [] }

    init(order: Order, candidateBarcodes: [String]) {
        self.order = order
        self.candidateBarcodes = candidateBarcodes
    }

    func currentOrder() -> Order { order }

    func substitutionCandidateBarcodes(for productID: ProductID) -> [String] {
        candidateBarcodes
    }

    func saveOrder(_ order: Order) {
        self.order = order
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

private actor FailOnceProductRepository: ProductRepository {
    private let product: Product
    private(set) var requestCount = 0

    init(product: Product) {
        self.product = product
    }

    func product(barcode: String) async throws -> Product {
        requestCount += 1
        guard requestCount > 1 else { throw ProductRepositoryTestError.notFound }
        return product
    }
}

private struct SlowProductRepository: ProductRepository {
    func product(barcode: String) async throws -> Product {
        try await Task.sleep(nanoseconds: 60_000_000_000)
        return Product(
            id: ProductID(rawValue: barcode),
            name: "Leite",
            category: "en:dairies",
            brand: nil,
            quantity: "1 L"
        )
    }
}

private enum ProductRepositoryTestError: Error {
    case notFound
}
