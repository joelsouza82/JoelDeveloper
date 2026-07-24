//
//  APIClient.swift
//  JoelDeveloper
//

import Foundation

struct APIClient {
    static let baseURL = "https://go-api-nzg1.onrender.com"

    private let baseURL: String
    private let session: URLSession

    init(baseURL: String = APIClient.baseURL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    func fetch<T: Decodable>(_ endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            throw APIError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}
