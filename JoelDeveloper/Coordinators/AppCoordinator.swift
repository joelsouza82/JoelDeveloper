//
//  AppCoordinator.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//
//  Gerenciador de navegação de toda a aplicação
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    enum Route: Hashable {
        case personal
        case experience
        case courses
        case others
    }

    @Published var navigationPath = NavigationPath()

    func navigate(to route: Route) {
        navigationPath.append(route)
    }
}
