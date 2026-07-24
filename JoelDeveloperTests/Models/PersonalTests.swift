//
//  PersonalTests.swift
//  JoelDeveloperTests
//

import XCTest
@testable import JoelDeveloper

final class PersonalTests: XCTestCase {
    func testDecodesPersonalFromJSON() throws {
        let data = Data(TestHelpers.samplePersonalJSON.utf8)
        let personals = try JSONDecoder().decode([Personal].self, from: data)

        XCTAssertEqual(personals.count, 1)

        let personal = try XCTUnwrap(personals.first)
        XCTAssertEqual(personal.id, 1)
        XCTAssertEqual(personal.address, "Rua Teste, 123")
        XCTAssertEqual(personal.city, "Feira de Santana")
        XCTAssertEqual(personal.neighborhood, "Centro")
        XCTAssertEqual(personal.state, "BA")
        XCTAssertEqual(personal.cep, "44000-000")
        XCTAssertEqual(personal.phone, "75999999999")
        XCTAssertEqual(personal.email, "test@example.com")
        XCTAssertEqual(personal.website, "https://example.com")
        XCTAssertEqual(personal.linkedin, "https://linkedin.com/in/test")
        XCTAssertEqual(personal.github, "https://github.com/test")
    }

    func testEncodesAndDecodesPersonal() throws {
        let personal = TestHelpers.makePersonal()
        let data = try JSONEncoder().encode(personal)
        let decoded = try JSONDecoder().decode(Personal.self, from: data)

        XCTAssertEqual(decoded.id, personal.id)
        XCTAssertEqual(decoded.address, personal.address)
        XCTAssertEqual(decoded.email, personal.email)
    }
}
