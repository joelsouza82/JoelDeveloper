//
//  APIErrorTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

final class APIErrorTests: XCTestCase {
    func testErrorDescriptions() {
        XCTAssertEqual(APIError.invalidURL.errorDescription, "URL inválida.")
        XCTAssertEqual(APIError.invalidResponse.errorDescription, "Resposta inválida do servidor.")
        XCTAssertEqual(APIError.httpError(statusCode: 404).errorDescription, "Erro HTTP 404.")
        XCTAssertEqual(APIError.decodingError.errorDescription, "Erro ao processar os dados.")
        XCTAssertEqual(APIError.emptyData.errorDescription, "Nenhum dado encontrado.")
    }
}
