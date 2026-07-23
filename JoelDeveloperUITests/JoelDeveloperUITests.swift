//
//  JoelDeveloperUITests.swift
//  JoelDeveloperUITests
//

import XCTest

final class JoelDeveloperUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testAppLaunchesSuccessfully() throws {
        let app = XCUIApplication()
        app.launch()

        app.waitForExistence(of: app.buttons["Dados Pessoais"])
    }
}
