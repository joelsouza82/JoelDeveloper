//
//  PersonalServiceFactory.swift
//  JoelDeveloper
//

import Foundation

enum PersonalServiceFactory {
    static func make() -> PersonalServiceProtocol {
        let arguments = ProcessInfo.processInfo.arguments

        if arguments.contains("-MockPersonalError") {
            return StubPersonalService.failure
        }

        if arguments.contains("-MockPersonalData") {
            return StubPersonalService.success
        }

        return PersonalService()
    }
}

enum StubPersonalService {
    static let success = SuccessStub()
    static let failure = FailureStub()

    private struct SuccessStub: PersonalServiceProtocol {
        func fetchPersonal() async throws -> Personal {
            Personal(
                id: 1,
                address: "Rua Teste, 123",
                city: "Feira de Santana",
                neighborhood: "Centro",
                state: "BA",
                cep: "44000-000",
                phone: "75999999999",
                email: "test@example.com",
                website: "https://example.com",
                linkedin: "https://linkedin.com/in/test",
                github: "https://github.com/test"
            )
        }
    }

    private struct FailureStub: PersonalServiceProtocol {
        func fetchPersonal() async throws -> Personal {
            throw APIError.httpError(statusCode: 500)
        }
    }
}
