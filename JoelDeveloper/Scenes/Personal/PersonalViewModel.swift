//
//  PersonalViewModel.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation
import Combine

@MainActor
class PersonalViewModel: ObservableObject {
    @Published var personal: Personal?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: PersonalServiceProtocol

    init(service: PersonalServiceProtocol = PersonalService(), autoLoad: Bool = true) {
        self.service = service
        if autoLoad {
            loadData()
        }
    }

    func loadData() {
        Task {
            await fetchPersonal()
        }
    }

    func fetchPersonal() async {
        isLoading = true
        errorMessage = nil

        do {
            personal = try await service.fetchPersonal()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
