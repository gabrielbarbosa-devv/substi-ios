import UIKit

@MainActor
final class AppCoordinator {
    private let navigationController: UINavigationController
    private let inventoryRepository: any InventoryRepository
    private let order: Order

    init(
        navigationController: UINavigationController,
        inventoryRepository: any InventoryRepository
    ) {
        self.navigationController = navigationController
        self.inventoryRepository = inventoryRepository
        order = inventoryRepository.currentOrder()
    }

    func start() {
        let viewModel = OrderViewModel(
            order: order,
            unavailableProductIDs: InventoryFixtures.unavailableProductIDs
        )
        let viewController = OrderViewController(viewModel: viewModel)
        viewController.onChooseSubstitute = { [weak self] productID in
            self?.showSuggestions(for: productID)
        }
        navigationController.viewControllers = [viewController]
    }

    private func showSuggestions(for productID: ProductID) {
        guard let product = order.items.first(where: { $0.product.id == productID })?.product else {
            return
        }

        let candidates = inventoryRepository.substitutionCandidates(for: productID)
        let viewModel = SuggestionsViewModel(originalProduct: product, candidates: candidates)
        navigationController.pushViewController(
            SuggestionsViewController(viewModel: viewModel),
            animated: true
        )
    }
}
