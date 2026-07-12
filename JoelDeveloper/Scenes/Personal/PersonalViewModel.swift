//
//  PersonalViewModel.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 12/07/26.
//

import Foundation
import Combine

final class PersonalViewModel: ObservableObject {
    @Published var address: String = "Endereço: Avenida Jorge Leal, 701"
}
