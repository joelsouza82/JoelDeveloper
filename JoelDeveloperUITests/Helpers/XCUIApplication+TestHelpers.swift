//
//  XCUIApplication+TestHelpers.swift
//  JoelDeveloperUITests
//

import XCTest

extension XCUIApplication {
    func launchWithMockPersonalData() {
        launchArguments.append("-MockPersonalData")
        launch()
    }

    func launchWithMockPersonalError() {
        launchArguments.append("-MockPersonalError")
        launch()
    }

    func tapHomeSection(named title: String) {
        buttons[title].tap()
    }

    func waitForExistence(of element: XCUIElement, timeout: TimeInterval = 5) {
        XCTAssertTrue(element.waitForExistence(timeout: timeout))
    }
}
