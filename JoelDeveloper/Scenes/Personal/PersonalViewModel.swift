//
//  PersonalViewModel.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation
import Combine

class PersonalViewModel: ObservableObject {
    @Published var personal: Personal?

    init() {
        loadData()
    }

    private func loadData() {
        personal = Personal(
            adress: "Rua Jorge Leal, 701 - Condominio Jardim França",
            city: "Feira de Santana",
            neighborhood: "Registro",
            state: "BA",
            cep: "44073-500",
            phone: "(75)99298-3300",
            email: "joelsouza82@gmail.com",
            website: String(),
            linkedin: "https://www.linkedin.com/in/joel-souza-79299479/",
            github: "https://github.com/joelsouza82"
        )
    }
}
