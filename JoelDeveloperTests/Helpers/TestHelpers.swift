//
//  TestHelpers.swift
//  JoelDeveloperTests
//

import XCTest

enum TestHelpers {
    static let samplePersonalJSON = """
    [{
        "id_personal": 1,
        "address": "Rua Teste, 123",
        "city": "Feira de Santana",
        "neighborhood": "Centro",
        "state": "BA",
        "cep": "44000-000",
        "phone": "75999999999",
        "email": "test@example.com",
        "website": "https://example.com",
        "linkedin": "https://linkedin.com/in/test",
        "github": "https://github.com/test"
    }]
    """

    static func makePersonal(
        id: Int = 1,
        address: String = "Rua Teste, 123",
        city: String = "Feira de Santana",
        neighborhood: String = "Centro",
        state: String = "BA",
        cep: String = "44000-000",
        phone: String = "75999999999",
        email: String = "test@example.com",
        website: String? = "https://example.com",
        linkedin: String? = "https://linkedin.com/in/test",
        github: String? = "https://github.com/test"
    ) -> Personal {
        Personal(
            id: id,
            address: address,
            city: city,
            neighborhood: neighborhood,
            state: state,
            cep: cep,
            phone: phone,
            email: email,
            website: website,
            linkedin: linkedin,
            github: github
        )
    }

    static func waitUntil(
        timeout: TimeInterval = 2,
        condition: @escaping () -> Bool
    ) async {
        let deadline = Date().addingTimeInterval(timeout)

        while Date() < deadline {
            if condition() {
                return
            }

            try? await Task.sleep(nanoseconds: 50_000_000)
        }

        XCTFail("Condition not met before timeout")
    }
}
