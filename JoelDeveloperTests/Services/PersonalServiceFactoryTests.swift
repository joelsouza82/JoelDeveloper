//
//  PersonalServiceFactoryTests.swift
//  JoelDeveloperTests
//

import Foundation
import XCTest

@testable import JoelDeveloper

final class PersonalServiceFactoryTests: XCTestCase {
    private var savedArguments: [String] = []

    override func setUp() {
        savedArguments = ProcessInfo.processInfo.arguments
        super.setUp()
    }

    override func tearDown() {
        ProcessInfo.processInfo.arguments = savedArguments
        super.tearDown()
    }

    func testMakeReturnsStubSuccessWhenMockPersonalDataArgumentIsPresent() async throws {
        ProcessInfo.processInfo.arguments.append("-MockPersonalData")

        let service = PersonalServiceFactory.make()
        let personal = try await service.fetchPersonal()

        XCTAssertEqual(personal.email, "test@example.com")
    }

    func testMakeReturnsStubFailureWhenMockPersonalErrorArgumentIsPresent() async {
        ProcessInfo.processInfo.arguments.append("-MockPersonalError")

        let service = PersonalServiceFactory.make()

        do {
            _ = try await service.fetchPersonal()
            XCTFail("Expected failure stub")
        } catch let error as APIError {
            XCTAssertEqual(error.errorDescription, "Erro HTTP 500.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
