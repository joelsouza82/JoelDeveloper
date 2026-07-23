//
//  PersonalServiceTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

final class PersonalServiceTests: XCTestCase {
    override func tearDown() {
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testFetchPersonalReturnsFirstItem() async throws {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: try XCTUnwrap(request.url),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data(TestHelpers.samplePersonalJSON.utf8))
        }

        let service = PersonalService(
            apiClient: APIClient(baseURL: "https://example.com", session: .makeMockSession())
        )

        let personal = try await service.fetchPersonal()

        XCTAssertEqual(personal.id, 1)
        XCTAssertEqual(personal.email, "test@example.com")
    }

    func testFetchPersonalThrowsWhenResponseIsEmpty() async {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: try XCTUnwrap(request.url),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data("[]".utf8))
        }

        let service = PersonalService(
            apiClient: APIClient(baseURL: "https://example.com", session: .makeMockSession())
        )

        do {
            _ = try await service.fetchPersonal()
            XCTFail("Expected empty data error")
        } catch let error as APIError {
            XCTAssertEqual(error.errorDescription, "Nenhum dado encontrado.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
