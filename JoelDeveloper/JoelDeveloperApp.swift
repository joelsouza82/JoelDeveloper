//
//  JoelDeveloperApp.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import SwiftUI

@main
struct JoelDeveloperApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.navigationPath) {
                HomeView(viewModel: HomeViewModel())
                    .navigationDestination(for: AppCoordinator.Route.self) { route in
                        switch route {
                        case .personal:
                            PersonalView(viewModel: PersonalViewModel())
                        case .experience:
                            Text("Experiências")
                        case .courses:
                            Text("Diplomas e cursos")
                        case .others:
                            Text("Outros")
                        }
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
