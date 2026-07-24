//
//  APIClientTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

final class APIClientTests: XCTestCase {
    override func tearDown() {
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testFetchReturnsDecodedResponse() async throws {
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.path, "/personals")
            let response = HTTPURLResponse(
                url: try XCTUnwrap(request.url),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data(TestHelpers.samplePersonalJSON.utf8))
        }

        let client = APIClient(baseURL: "https://example.com", session: .makeMockSession())
        let personals: [Personal] = try await client.fetch("/personals", type: [Personal].self)

        XCTAssertEqual(personals.count, 1)
        XCTAssertEqual(personals.first?.email, "test@example.com")
    }

    func testFetchThrowsHTTPError() async {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: try XCTUnwrap(request.url),
                statusCode: 500,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        let client = APIClient(baseURL: "https://example.com", session: .makeMockSession())

        do {
            _ = try await client.fetch("/personals", type: [Personal].self) as [Personal]
            XCTFail("Expected HTTP error")
        } catch let error as APIError {
            XCTAssertEqual(error.errorDescription, "Erro HTTP 500.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testFetchThrowsDecodingError() async {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: try XCTUnwrap(request.url),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data("invalid-json".utf8))
        }

        let client = APIClient(baseURL: "https://example.com", session: .makeMockSession())

        do {
            _ = try await client.fetch("/personals", type: [Personal].self) as [Personal]
            XCTFail("Expected decoding error")
        } catch let error as APIError {
            XCTAssertEqual(error.errorDescription, "Erro ao processar os dados.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testFetchThrowsInvalidURL() async {
        let client = APIClient(baseURL: "ht tp://invalid url", session: .makeMockSession())

        do {
            _ = try await client.fetch("/personals", type: [Personal].self) as [Personal]
            XCTFail("Expected invalid URL error")
        } catch let error as APIError {
            XCTAssertEqual(error.errorDescription, "URL inválida.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
