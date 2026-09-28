//
//  SubstiUITests.swift
//  SubstiUITests
//
//  Created by user on 27/09/26.
//

import XCTest

final class SubstiUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testOrderScreenPassesAccessibilityAudit() throws {
        XCUIDevice.shared.orientation = .portrait
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.navigationBars["Meu pedido"].waitForExistence(timeout: 5))
        guard #available(iOS 17.0, *) else {
            throw XCTSkip("A auditoria de acessibilidade do XCTest requer iOS 17 ou posterior.")
        }
        try app.performAccessibilityAudit { issue in
            // A card crossing a scroll viewport edge is expected; large-text scrolling is tested separately.
            issue.auditType == .textClipped
        }
    }

    @MainActor
    func testOrderContentCanScrollAtAccessibilityTextSize() throws {
        XCUIDevice.shared.orientation = .portrait
        let app = XCUIApplication()
        app.launchArguments += [
            "-UIPreferredContentSizeCategoryName",
            "UICTContentSizeCategoryAccessibilityXXXL"
        ]
        app.launch()

        let chooseButton = app.buttons["order-choose-substitute"]
        let substitutionBanner = app.descendants(matching: .any)["order-substitution-info"]
        XCTAssertTrue(chooseButton.waitForExistence(timeout: 5))
        XCTAssertTrue(substitutionBanner.waitForExistence(timeout: 5))

        let content = app.scrollViews.firstMatch
        for _ in 0..<6 where substitutionBanner.frame.maxY > chooseButton.frame.minY {
            content.swipeUp()
        }

        XCTAssertTrue(chooseButton.isHittable)
        XCTAssertTrue(substitutionBanner.exists)
        XCTAssertLessThanOrEqual(substitutionBanner.frame.maxY, chooseButton.frame.minY)
    }

    @MainActor
    func testSubstitutionJourneyUpdatesOrder() throws {
        XCUIDevice.shared.orientation = .portrait
        let app = XCUIApplication()
        app.launchArguments.append("--uitest-demo-catalog")
        app.launch()

        let startButton = app.buttons["order-choose-substitute"]
        XCTAssertTrue(startButton.waitForExistence(timeout: 5))
        startButton.tap()

        let candidate = app.descendants(matching: .any)["suggestion-candidate-7898215151708"]
        XCTAssertTrue(candidate.waitForExistence(timeout: 5))
        candidate.tap()

        let comparisonButton = app.buttons["suggestions-view-comparison"]
        XCTAssertTrue(comparisonButton.isEnabled)
        comparisonButton.tap()

        let chooseButton = app.buttons["comparison-choose-substitute"]
        XCTAssertTrue(chooseButton.waitForExistence(timeout: 5))
        chooseButton.tap()

        let confirmButton = app.buttons["confirmation-confirm"]
        XCTAssertTrue(confirmButton.waitForExistence(timeout: 5))
        confirmButton.tap()

        XCTAssertTrue(
            app.staticTexts["Substituição confirmada. Seu pedido foi atualizado."]
                .waitForExistence(timeout: 5)
        )
        XCTAssertTrue(app.descendants(matching: .any)["order-product-7898215151708"].exists)
    }

    @MainActor
    func testRemainingScreensPassAccessibilityAudit() throws {
        guard #available(iOS 17.0, *) else {
            throw XCTSkip("A auditoria de acessibilidade do XCTest requer iOS 17 ou posterior.")
        }

        XCUIDevice.shared.orientation = .portrait
        let app = XCUIApplication()
        app.launchArguments.append("--uitest-demo-catalog")
        app.launch()
        app.buttons["order-choose-substitute"].tap()

        let candidate = app.descendants(matching: .any)["suggestion-candidate-7898215151708"]
        XCTAssertTrue(candidate.waitForExistence(timeout: 5))
        try app.performAccessibilityAudit()
        candidate.tap()
        app.buttons["suggestions-view-comparison"].tap()

        let chooseButton = app.buttons["comparison-choose-substitute"]
        XCTAssertTrue(chooseButton.waitForExistence(timeout: 5))
        try app.performAccessibilityAudit()
        chooseButton.tap()

        let confirmButton = app.buttons["confirmation-confirm"]
        XCTAssertTrue(confirmButton.waitForExistence(timeout: 5))
        try app.performAccessibilityAudit()
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
