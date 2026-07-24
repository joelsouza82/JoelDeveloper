//
//  Personal.swift
//  JoelDeveloper
//
//  Created by Joel de Almeida Souza on 13/07/26.
//

struct Personal: Codable {
    let id: Int
    let address: String
    let city: String
    let neighborhood: String
    let state: String
    let cep: String
    let phone: String
    let email: String
    let website: String?
    let linkedin: String?
    let github: String?

    enum CodingKeys: String, CodingKey {
        case id = "id_personal"
        case address, city, neighborhood, state, cep, phone, email, website, linkedin, github
    }
}
