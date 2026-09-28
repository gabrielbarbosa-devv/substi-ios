import UIKit

@MainActor
final class LaunchViewController: UIViewController {
    var onAnimationCompleted: (() -> Void)?

    private let markImageView = UIImageView(
        image: UIImage(named: "SubstiMark") ?? UIImage(systemName: "leaf.fill")
    )
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private var hasStartedAnimation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        buildHierarchy()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasStartedAnimation else { return }
        hasStartedAnimation = true
        animateEntrance()
    }

    private func configureViews() {
        view.backgroundColor = DSColor.backgroundPrimary

        markImageView.image = markImageView.image?.withRenderingMode(.alwaysOriginal)
        markImageView.contentMode = .scaleAspectFit
        markImageView.isAccessibilityElement = false

        titleLabel.text = "Substi"
        titleLabel.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
            for: .systemFont(ofSize: 34, weight: .semibold)
        )
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = DSColor.textPrimary
        titleLabel.textAlignment = .center

        subtitleLabel.text = "Substituições inteligentes"
        subtitleLabel.font = DSTypography.body
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.textColor = DSColor.textSecondary
        subtitleLabel.textAlignment = .center
    }

    private func buildHierarchy() {
        [markImageView, titleLabel, subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            markImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            markImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -52),
            markImageView.widthAnchor.constraint(equalToConstant: 80),
            markImageView.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.topAnchor.constraint(equalTo: markImageView.bottomAnchor, constant: DSSpacing.small),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DSSpacing.xSmall),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }

    private func animateEntrance() {
        let shouldReduceMotion = UIAccessibility.isReduceMotionEnabled
        markImageView.alpha = 0
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0

        if !shouldReduceMotion {
            markImageView.transform = CGAffineTransform(scaleX: 0.78, y: 0.78)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: 8)
            subtitleLabel.transform = CGAffineTransform(translationX: 0, y: 8)
        }

        let revealContent = {
            self.markImageView.alpha = 1
            self.markImageView.transform = .identity
            self.titleLabel.alpha = 1
            self.titleLabel.transform = .identity
            self.subtitleLabel.alpha = 1
            self.subtitleLabel.transform = .identity
        }
        let complete: (Bool) -> Void = { [weak self] _ in
            self?.onAnimationCompleted?()
        }

        if shouldReduceMotion {
            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction, .curveEaseInOut],
                animations: revealContent,
                completion: complete
            )
        } else {
            UIView.animate(
                withDuration: 0.65,
                delay: 0,
                usingSpringWithDamping: 0.82,
                initialSpringVelocity: 0.25,
                options: [.beginFromCurrentState, .allowUserInteraction],
                animations: revealContent,
                completion: complete
            )
        }
    }
}
