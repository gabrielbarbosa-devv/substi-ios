import SubstiDomain
import UIKit

/// Owns route transitions for the app flow; screen construction is delegated to AppScreenFactory.
@MainActor
final class AppCoordinator {
    private let navigationController: UINavigationController
    private let screenFactory: AppScreenFactory

    init(navigationController: UINavigationController, screenFactory: AppScreenFactory) {
        self.navigationController = navigationController
        self.screenFactory = screenFactory
    }

    func start() {
        let launchViewController = screenFactory.makeLaunchViewController { [weak self] in
            self?.showOrderAfterLaunch()
        }
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([launchViewController], animated: false)
    }

    private func showOrderAfterLaunch() {
        let orderViewController = screenFactory.makeOrderViewController { [weak self] productID in
            self?.showSuggestions(for: productID)
        }
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
        guard let viewController = screenFactory.makeSuggestionsViewController(
            for: productID,
            onShowComparison: { [weak self] originalItem, candidate in
                self?.showComparison(originalItem: originalItem, candidate: candidate)
            }
        ) else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showComparison(originalItem: OrderItem, candidate: SubstitutionCandidate) {
        let viewController = screenFactory.makeComparisonViewController(
            originalItem: originalItem,
            candidate: candidate,
            onChooseAnother: { [weak self] in
                self?.navigationController.popViewController(animated: true)
            },
            onConfirmSubstitute: { [weak self] originalProductID, candidate, productViewModel in
                self?.showConfirmation(
                    originalProductID: originalProductID,
                    candidate: candidate,
                    productViewModel: productViewModel
                )
            }
        )
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showConfirmation(
        originalProductID: ProductID,
        candidate: SubstitutionCandidate,
        productViewModel: ProductComparisonViewModel
    ) {
        let viewController = screenFactory.makeConfirmationViewController(
            originalProductID: originalProductID,
            candidate: candidate,
            productViewModel: productViewModel,
            onConfirmed: { [weak self] updatedOrder in
                self?.showConfirmedOrder(updatedOrder)
            },
            onCancel: { [weak self] in
                self?.navigationController.dismiss(animated: true)
            }
        )
        navigationController.present(viewController, animated: true)
    }

    private func showConfirmedOrder(_ updatedOrder: Order) {
        navigationController.dismiss(animated: true) { [weak self] in
            guard let self else { return }
            let orderViewController = self.screenFactory.makeOrderViewController(order: updatedOrder) {
                [weak self] productID in
                self?.showSuggestions(for: productID)
            }
            self.navigationController.setViewControllers(
                [orderViewController],
                animated: false
            )
        }
    }
}
