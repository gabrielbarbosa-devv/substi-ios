import SubstiDomain
import Testing
@testable import Substi

@MainActor
struct ConfirmationViewModelTests {
    @Test
    func confirmsCandidateAndNotifiesCoordinatorWithUpdatedOrder() {
        let repository = DemoInventoryRepository()
        let viewModel = makeViewModel(
            repository: repository,
            candidate: makeCandidate(barcode: "7898215151708")
        )
        var confirmedOrder: Order?
        viewModel.onConfirmed = { confirmedOrder = $0 }

        viewModel.confirm()

        #expect(viewModel.state == .confirmed)
        #expect(confirmedOrder?.items[1].product.id.rawValue == "7898215151708")
        #expect(repository.currentOrder().items[1].product.id.rawValue == "7898215151708")
    }

    @Test
    func exposesFailureAndCanReturnToReadyAfterErrorIsDismissed() {
        let repository = DemoInventoryRepository()
        let originalProductID = InventoryFixtures.unavailableProduct.id
        let viewModel = makeViewModel(
            repository: repository,
            candidate: makeCandidate(barcode: "unknown")
        )
        var didEmitSuccess = false
        viewModel.onConfirmed = { _ in didEmitSuccess = true }

        viewModel.confirm()

        #expect(viewModel.state == .failed)
        #expect(!didEmitSuccess)
        #expect(repository.currentOrder().items[1].product.id == originalProductID)

        viewModel.dismissError()

        #expect(viewModel.state == .ready)
    }

    private func makeViewModel(
        repository: any InventoryRepository,
        candidate: SubstitutionCandidate
    ) -> ConfirmationViewModel {
        ConfirmationViewModel(
            originalProductID: InventoryFixtures.unavailableProduct.id,
            candidate: candidate,
            confirmSubstitution: ConfirmSubstitutionUseCase(inventoryRepository: repository)
        )
    }

    private func makeCandidate(barcode: String) -> SubstitutionCandidate {
        SubstitutionCandidate(product: Product(
            id: ProductID(rawValue: barcode),
            name: "Leite Integral",
            category: "en:dairies",
            brand: "Marca B",
            quantity: "1 L"
        ))
    }
}
