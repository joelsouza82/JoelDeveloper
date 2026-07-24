//
//  APIError.swift
//  JoelDeveloper
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
    case emptyData

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida."
        case .invalidResponse:
            return "Resposta inválida do servidor."
        case .httpError(let statusCode):
            return "Erro HTTP \(statusCode)."
        case .decodingError:
            return "Erro ao processar os dados."
        case .emptyData:
            return "Nenhum dado encontrado."
        }
    }
}
