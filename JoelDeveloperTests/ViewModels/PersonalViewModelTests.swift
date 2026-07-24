//
//  PersonalViewModelTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

@MainActor
final class PersonalViewModelTests: XCTestCase {
    func testFetchPersonalSuccess() async {
        let personal = TestHelpers.makePersonal()
        let service = MockPersonalService(result: .success(personal))
        let viewModel = PersonalViewModel(service: service, autoLoad: false)

        await viewModel.fetchPersonal()

        XCTAssertEqual(viewModel.personal?.email, "test@example.com")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(service.fetchCallCount, 1)
    }

    func testFetchPersonalFailure() async {
        let service = MockPersonalService(result: .failure(APIError.httpError(statusCode: 500)))
        let viewModel = PersonalViewModel(service: service, autoLoad: false)

        await viewModel.fetchPersonal()

        XCTAssertNil(viewModel.personal)
        XCTAssertEqual(viewModel.errorMessage, "Erro HTTP 500.")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testLoadDataFetchesPersonalOnInit() async {
        let personal = TestHelpers.makePersonal()
        let service = MockPersonalService(result: .success(personal))
        _ = PersonalViewModel(service: service)

        await TestHelpers.waitUntil { service.fetchCallCount == 1 }
    }

    func testLoadDataRetriesFetch() async {
        let personal = TestHelpers.makePersonal()
        let service = MockPersonalService(result: .success(personal))
        let viewModel = PersonalViewModel(service: service, autoLoad: false)

        viewModel.loadData()

        await TestHelpers.waitUntil {
            service.fetchCallCount == 1 && viewModel.personal != nil
        }
        XCTAssertEqual(viewModel.personal?.email, "test@example.com")
    }
}
