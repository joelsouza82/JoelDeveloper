//
//  Section.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation

// Renamed to avoid collision with SwiftUI.Section
struct AppSection: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let route: AppCoordinator.Route
}
