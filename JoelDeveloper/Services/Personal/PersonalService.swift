//
//  PersonalService.swift
//  JoelDeveloper
//

import Foundation

protocol PersonalServiceProtocol {
    func fetchPersonal() async throws -> Personal
}

struct PersonalService: PersonalServiceProtocol {
    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchPersonal() async throws -> Personal {
        let personals: [Personal] = try await apiClient.fetch("/personals", type: [Personal].self)

        guard let personal = personals.first else {
            throw APIError.emptyData
        }

        return personal
    }
}
