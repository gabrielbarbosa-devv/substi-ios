import UIKit
import SwiftUI

@MainActor
final class AppCoordinator {
    private let navigationController: UINavigationController
    private let inventoryRepository: any InventoryRepository
    private let loadProductUseCase: LoadProductUseCase

    init(
        navigationController: UINavigationController,
        inventoryRepository: any InventoryRepository,
        productRepository: any ProductRepository
    ) {
        self.navigationController = navigationController
        self.inventoryRepository = inventoryRepository
        loadProductUseCase = LoadProductUseCase(productRepository: productRepository)
    }

    func start() {
        navigationController.viewControllers = [makeOrderViewController(order: inventoryRepository.currentOrder())]
    }

    private func showSuggestions(for productID: ProductID) {
        let order = inventoryRepository.currentOrder()
        guard let originalItem = order.items.first(where: { $0.product.id == productID }) else {
            return
        }

        let candidateBarcodes = inventoryRepository.substitutionCandidateBarcodes(for: productID)
        let viewModel = SuggestionsViewModel(
            originalProduct: originalItem.product,
            originalPrice: originalItem.price,
            candidateBarcodes: candidateBarcodes,
            loadProduct: loadProductUseCase
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
        let comparisonView = ProductComparisonView(
            viewModel: viewModel,
            onChooseAnother: { [weak self] in
                self?.navigationController.popViewController(animated: true)
            },
            onConfirmSubstitute: { [weak self] in
                self?.showConfirmation(
                    originalProductID: originalItem.product.id,
                    candidate: candidate,
                    viewModel: viewModel
                )
            }
        )
        let hostingController = UIHostingController(rootView: comparisonView)
        navigationController.pushViewController(hostingController, animated: true)
    }

    private func showConfirmation(
        originalProductID: ProductID,
        candidate: SubstitutionCandidate,
        viewModel: ProductComparisonViewModel
    ) {
        let confirmationView = ConfirmationView(
            viewModel: viewModel,
            onConfirm: { [weak self] in
                self?.confirmSubstitution(for: originalProductID, candidate: candidate)
            },
            onCancel: { [weak self] in
                self?.navigationController.dismiss(animated: true)
            }
        )
        let hostingController = UIHostingController(rootView: confirmationView)
        hostingController.modalPresentationStyle = .pageSheet
        if let sheet = hostingController.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = DSRadius.large
        }
        navigationController.present(hostingController, animated: true)
    }

    private func confirmSubstitution(for originalProductID: ProductID, candidate: SubstitutionCandidate) {
        guard let updatedOrder = inventoryRepository.confirmSubstitution(
            for: originalProductID,
            with: candidate
        ) else {
            let alert = UIAlertController(
                title: "Não foi possível confirmar",
                message: "A opção selecionada não está mais disponível nos dados de demonstração.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            navigationController.presentedViewController?.present(alert, animated: true)
            return
        }

        navigationController.dismiss(animated: true) { [weak self] in
            guard let self else { return }
            self.navigationController.setViewControllers(
                [self.makeOrderViewController(order: updatedOrder)],
                animated: false
            )
        }
    }

    private func makeOrderViewController(order: Order) -> OrderViewController {
        let viewModel = OrderViewModel(
            order: order,
            unavailableProductIDs: InventoryFixtures.unavailableProductIDs
        )
        let viewController = OrderViewController(viewModel: viewModel)
        viewController.onChooseSubstitute = { [weak self] productID in
            self?.showSuggestions(for: productID)
        }
        return viewController
    }
}
