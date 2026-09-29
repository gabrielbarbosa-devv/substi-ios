import SubstiDomain
import UIKit
import SwiftUI

@MainActor
final class AppCoordinator {
    private let navigationController: UINavigationController
    private let inventoryRepository: any InventoryRepository
    private let loadCandidatesUseCase: LoadSubstitutionCandidatesUseCase
    private let imageLoader: ProductImageLoader
    private let confirmSubstitutionUseCase: ConfirmSubstitutionUseCase

    init(
        navigationController: UINavigationController,
        inventoryRepository: any InventoryRepository,
        loadCandidatesUseCase: LoadSubstitutionCandidatesUseCase,
        imageLoader: ProductImageLoader,
        confirmSubstitutionUseCase: ConfirmSubstitutionUseCase
    ) {
        self.navigationController = navigationController
        self.inventoryRepository = inventoryRepository
        self.loadCandidatesUseCase = loadCandidatesUseCase
        self.imageLoader = imageLoader
        self.confirmSubstitutionUseCase = confirmSubstitutionUseCase
    }

    func start() {
        let launchViewController = LaunchViewController()
        launchViewController.onAnimationCompleted = { [weak self] in
            self?.showOrderAfterLaunch()
        }
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [launchViewController]
    }

    private func showOrderAfterLaunch() {
        let orderViewController = makeOrderViewController(order: inventoryRepository.currentOrder())
        navigationController.setNavigationBarHidden(false, animated: false)
        UIView.transition(
            with: navigationController.view,
            duration: 0.24,
            options: .transitionCrossDissolve
        ) {
            self.navigationController.setViewControllers([orderViewController], animated: false)
        }
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
            loadCandidates: loadCandidatesUseCase
        )
        let viewController = SuggestionsViewController(viewModel: viewModel, imageLoader: imageLoader)
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
            imageLoader: imageLoader,
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
        let confirmationViewModel = ConfirmationViewModel(
            originalProductID: originalProductID,
            candidate: candidate,
            confirmSubstitution: confirmSubstitutionUseCase
        )
        confirmationViewModel.onConfirmed = { [weak self] updatedOrder in
            self?.showConfirmedOrder(updatedOrder)
        }

        let confirmationView = ConfirmationView(
            productViewModel: viewModel,
            viewModel: confirmationViewModel,
            imageLoader: imageLoader,
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

    private func showConfirmedOrder(_ updatedOrder: Order) {
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
            unavailableProductIDs: inventoryRepository.unavailableProductIDs
        )
        let viewController = OrderViewController(viewModel: viewModel)
        viewController.onChooseSubstitute = { [weak self] productID in
            self?.showSuggestions(for: productID)
        }
        return viewController
    }
}
