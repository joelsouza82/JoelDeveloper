//
//  NavigationUITests.swift
//  JoelDeveloperUITests
//

import XCTest

final class NavigationUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testNavigateToExperienceScreen() throws {
        let app = XCUIApplication()
        app.launch()
        app.tapHomeSection(named: "Experiências")

        app.waitForExistence(of: app.staticTexts["Experiências"])
    }

    @MainActor
    func testNavigateToCoursesScreen() throws {
        let app = XCUIApplication()
        app.launch()
        app.tapHomeSection(named: "Diplomas e Cursos")

        app.waitForExistence(of: app.staticTexts["Diplomas e cursos"])
    }

    @MainActor
    func testNavigateToOthersScreen() throws {
        let app = XCUIApplication()
        app.launch()
        app.tapHomeSection(named: "Outras Informações")

        app.waitForExistence(of: app.staticTexts["Outros"])
    }

    @MainActor
    func testNavigateToPersonalAndBack() throws {
        let app = XCUIApplication()
        app.launchWithMockPersonalData()
        app.tapHomeSection(named: "Dados Pessoais")

        app.waitForExistence(of: app.navigationBars["🏠 Dados Pessoais"])

        app.navigationBars.buttons.element(boundBy: 0).tap()

        app.waitForExistence(of: app.buttons["Dados Pessoais"])
    }
}
