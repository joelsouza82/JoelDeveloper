//
//  HomeUITests.swift
//  JoelDeveloperUITests
//

import XCTest

final class HomeUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testHomeDisplaysAllSections() throws {
        let app = XCUIApplication()
        app.launch()

        let expectedSections = [
            "Dados Pessoais",
            "Experiências",
            "Diplomas e Cursos",
            "Outras Informações"
        ]

        for section in expectedSections {
            app.waitForExistence(of: app.buttons[section])
        }
    }

    @MainActor
    func testHomeDisplaysNavigationTitle() throws {
        let app = XCUIApplication()
        app.launch()

        app.waitForExistence(of: app.navigationBars["🧑🏽‍💻 Joel de Almeida Souza"])
    }
}
