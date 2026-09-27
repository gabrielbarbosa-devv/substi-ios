import UIKit
import SwiftUI

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
        guard let originalItem = order.items.first(where: { $0.product.id == productID }) else {
            return
        }

        let candidates = inventoryRepository.substitutionCandidates(for: productID)
        let viewModel = SuggestionsViewModel(
            originalProduct: originalItem.product,
            originalPrice: originalItem.price,
            candidates: candidates
        )
        let viewController = SuggestionsViewController(viewModel: viewModel)
        viewController.onShowComparison = { [weak self] candidate in
            self?.showComparison(originalItem: originalItem, candidate: candidate)
        }
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showComparison(originalItem: OrderItem, candidate: SubstitutionCandidate) {
        let viewModel = ProductComparisonViewModel(
            originalProduct: originalItem.product,
            originalPrice: originalItem.price,
            substituteProduct: candidate.product
        )
        let comparisonView = ProductComparisonView(viewModel: viewModel) { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        let hostingController = UIHostingController(rootView: comparisonView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
