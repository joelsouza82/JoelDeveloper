//
//  Home.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation

struct Home: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let route: AppCoordinator.Route
}
