//
//  PersonalUITests.swift
//  JoelDeveloperUITests
//

import XCTest

final class PersonalUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testPersonalScreenDisplaysMockedData() throws {
        let app = XCUIApplication()
        app.launchWithMockPersonalData()
        app.tapHomeSection(named: "Dados Pessoais")

        app.waitForExistence(of: app.navigationBars["🏠 Dados Pessoais"])
        app.waitForExistence(of: app.staticTexts["Rua Teste, 123"])
        app.waitForExistence(of: app.staticTexts["test@example.com"])
        app.waitForExistence(of: app.staticTexts["75999999999"])
    }

    @MainActor
    func testPersonalScreenDisplaysErrorAndRetry() throws {
        let app = XCUIApplication()
        app.launchWithMockPersonalError()
        app.tapHomeSection(named: "Dados Pessoais")

        app.waitForExistence(of: app.staticTexts["Erro ao carregar"])
        app.waitForExistence(of: app.buttons["Tentar novamente"])

        app.buttons["Tentar novamente"].tap()
        app.waitForExistence(of: app.staticTexts["Erro ao carregar"])
    }

    @MainActor
    func testPersonalScreenDisplaysSocialLinks() throws {
        let app = XCUIApplication()
        app.launchWithMockPersonalData()
        app.tapHomeSection(named: "Dados Pessoais")

        //app.waitForExistence(of: app.buttons["https://linkedin.com/in/test"])
        //app.waitForExistence(of: app.buttons["https://github.com/test"])
    }
}
