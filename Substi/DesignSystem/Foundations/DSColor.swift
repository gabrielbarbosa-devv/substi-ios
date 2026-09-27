import UIKit

enum DSColor {
    static let brandPrimary = UIColor(red: 12 / 255, green: 122 / 255, blue: 104 / 255, alpha: 1)
    static let brandSecondary = UIColor(red: 34 / 255, green: 197 / 255, blue: 94 / 255, alpha: 1)

    static let backgroundPrimary = adaptive(
        light: UIColor(red: 248 / 255, green: 250 / 255, blue: 247 / 255, alpha: 1),
        dark: .systemBackground
    )
    static let backgroundSecondary = UIColor.secondarySystemBackground
    static let surfacePrimary = adaptive(light: .white, dark: .secondarySystemBackground)
    static let surfaceSecondary = UIColor.tertiarySystemBackground

    static let textPrimary = adaptive(
        light: UIColor(red: 15 / 255, green: 23 / 255, blue: 42 / 255, alpha: 1),
        dark: .label
    )
    static let textSecondary = adaptive(
        light: UIColor(red: 100 / 255, green: 116 / 255, blue: 139 / 255, alpha: 1),
        dark: .secondaryLabel
    )
    static let textInverse = UIColor.white
    static let borderDefault = UIColor.separator

    static let statusSuccess = UIColor(red: 22 / 255, green: 163 / 255, blue: 74 / 255, alpha: 1)
    static let statusWarning = UIColor(red: 245 / 255, green: 158 / 255, blue: 11 / 255, alpha: 1)
    static let statusError = UIColor(red: 239 / 255, green: 68 / 255, blue: 68 / 255, alpha: 1)
    static let surfaceSuccess = statusSuccess.withAlphaComponent(0.12)
    static let surfaceWarning = statusWarning.withAlphaComponent(0.14)
    static let surfaceError = statusError.withAlphaComponent(0.12)
    static let surfaceInformation = UIColor.systemBlue.withAlphaComponent(0.12)

    static let interactivePrimary = brandPrimary
    static let interactiveDisabled = UIColor.tertiarySystemFill

    private static func adaptive(light: UIColor, dark: UIColor) -> UIColor {
        UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        }
    }
}
