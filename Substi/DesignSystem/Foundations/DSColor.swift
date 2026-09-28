import UIKit

enum DSColor {
    private static let brandPrimaryBase = UIColor(red: 12 / 255, green: 122 / 255, blue: 104 / 255, alpha: 1)
    static let brandPrimary = adaptive(
        light: brandPrimaryBase,
        dark: UIColor(red: 77 / 255, green: 208 / 255, blue: 181 / 255, alpha: 1)
    )
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
        light: UIColor(red: 71 / 255, green: 85 / 255, blue: 105 / 255, alpha: 1),
        dark: .secondaryLabel
    )
    static let textInverse = UIColor.white
    static let borderDefault = UIColor.separator

    static let statusSuccess = adaptive(
        light: UIColor(red: 22 / 255, green: 101 / 255, blue: 52 / 255, alpha: 1),
        dark: UIColor(red: 74 / 255, green: 222 / 255, blue: 128 / 255, alpha: 1)
    )
    static let statusWarning = UIColor(red: 245 / 255, green: 158 / 255, blue: 11 / 255, alpha: 1)
    static let statusError = UIColor(red: 239 / 255, green: 68 / 255, blue: 68 / 255, alpha: 1)
    static let surfaceSuccess = statusSuccess.withAlphaComponent(0.12)
    static let surfaceWarning = statusWarning.withAlphaComponent(0.14)
    static let surfaceError = statusError.withAlphaComponent(0.12)
    static let surfaceInformation = UIColor.systemBlue.withAlphaComponent(0.12)

    static let interactivePrimary = UIColor(
        red: 0 / 255,
        green: 88 / 255,
        blue: 77 / 255,
        alpha: 1
    )
    static let interactiveDisabled = UIColor.tertiarySystemFill

    private static func adaptive(light: UIColor, dark: UIColor) -> UIColor {
        UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        }
    }
}
