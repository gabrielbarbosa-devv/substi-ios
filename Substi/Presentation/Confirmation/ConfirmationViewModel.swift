import Combine
import SubstiDomain

@MainActor
final class ConfirmationViewModel: ObservableObject {
    enum State: Equatable {
        case ready
        case failed
        case confirmed
    }

    @Published private(set) var state: State = .ready

    private let originalProductID: ProductID
    private let candidate: SubstitutionCandidate
    private let confirmSubstitution: ConfirmSubstitutionUseCase

    var onConfirmed: ((Order) -> Void)?

    init(
        originalProductID: ProductID,
        candidate: SubstitutionCandidate,
        confirmSubstitution: ConfirmSubstitutionUseCase
    ) {
        self.originalProductID = originalProductID
        self.candidate = candidate
        self.confirmSubstitution = confirmSubstitution
    }

    func confirm() {
        guard state == .ready else { return }

        guard let updatedOrder = confirmSubstitution.execute(
            for: originalProductID,
            with: candidate
        ) else {
            state = .failed
            return
        }

        state = .confirmed
        onConfirmed?(updatedOrder)
    }

    func dismissError() {
        guard state == .failed else { return }
        state = .ready
    }
}
