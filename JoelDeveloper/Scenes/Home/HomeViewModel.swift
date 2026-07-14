//
//  HomeViewModel.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var sections: [Home] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        sections = [
            Home(title: "Dados Pessoais", icon: "person.fill", route: .personal),
            Home(title: "Experiências", icon: "briefcase.fill", route: .experience),
            Home(title: "Diplomas e Cursos", icon: "graduationcap.fill", route: .courses),
            Home(title: "Outras Informações", icon: "ellipsis", route: .others)
        ]
    }
}
