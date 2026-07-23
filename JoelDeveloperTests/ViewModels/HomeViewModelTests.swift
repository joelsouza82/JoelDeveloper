//
//  HomeViewModelTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

final class HomeViewModelTests: XCTestCase {
    func testLoadsAllSections() {
        let viewModel = HomeViewModel()

        XCTAssertEqual(viewModel.sections.count, 4)
        XCTAssertEqual(viewModel.sections.map(\.title), [
            "Dados Pessoais",
            "Experiências",
            "Diplomas e Cursos",
            "Outras Informações"
        ])
    }

    func testSectionsContainExpectedRoutes() {
        let viewModel = HomeViewModel()
        let routes = viewModel.sections.map(\.route)

        XCTAssertEqual(routes, [.personal, .experience, .courses, .others])
    }

    func testSectionsContainExpectedIcons() {
        let viewModel = HomeViewModel()
        let icons = viewModel.sections.map(\.icon)

        XCTAssertEqual(icons, [
            "person.fill",
            "briefcase.fill",
            "graduationcap.fill",
            "ellipsis"
        ])
    }
}
