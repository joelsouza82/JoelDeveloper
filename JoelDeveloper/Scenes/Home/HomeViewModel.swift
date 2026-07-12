//
//  HomeViewModel.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var sections: [AppSection] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        sections = [
            AppSection(title: "Dados Pessoais", icon: "person.fill", route: .personal),
            AppSection(title: "Experiências", icon: "briefcase.fill", route: .experience),
            AppSection(title: "Diplomas e Cursos", icon: "graduationcap.fill", route: .courses),
            AppSection(title: "Outras Informações", icon: "ellipsis", route: .others)
        ]
    }
}
