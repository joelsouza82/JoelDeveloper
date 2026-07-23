//
//  AppCoordinatorTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper
internal import SwiftUI

final class AppCoordinatorTests: XCTestCase {
    func testNavigateAppendsRouteToNavigationPath() {
        let coordinator = AppCoordinator()

        XCTAssertTrue(coordinator.navigationPath.isEmpty)

        coordinator.navigate(to: .personal)

        XCTAssertEqual(coordinator.navigationPath.count, 1)
    }

    func testNavigateToMultipleRoutes() {
        let coordinator = AppCoordinator()

        coordinator.navigate(to: .personal)
        coordinator.navigate(to: .experience)
        coordinator.navigate(to: .courses)

        XCTAssertEqual(coordinator.navigationPath.count, 3)
    }
}
