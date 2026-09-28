import Foundation
import OSLog

enum AppLog {
    private static let subsystem = "com.gabrielbarbosa.substi"

    static let network = Logger(subsystem: subsystem, category: "network")
    static let suggestions = Logger(subsystem: subsystem, category: "suggestions")
}
