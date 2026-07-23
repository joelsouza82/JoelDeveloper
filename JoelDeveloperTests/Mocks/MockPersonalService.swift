//
//  MockPersonalService.swift
//  JoelDeveloperTests
//

import Foundation
@testable import JoelDeveloper

final class MockPersonalService: PersonalServiceProtocol {
    enum MockResult {
        case success(Personal)
        case failure(Error)
    }

    var result: MockResult
    private(set) var fetchCallCount = 0

    init(result: MockResult) {
        self.result = result
    }

    func fetchPersonal() async throws -> Personal {
        fetchCallCount += 1

        switch result {
        case .success(let personal):
            return personal
        case .failure(let error):
            throw error
        }
    }
}
