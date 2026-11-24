//
//  FilmeApiError.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation

enum FilmeApiError: LocalizedError {
    case invalidResponse
    case httpError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Resposta inválida do servidor"
        case .httpError(let status):
            return "Erro HTTP: \(status)"
        }
    }
}

class FilmeService {
    private let baseUrl = URL(string: "https://ghibliapi.vercel.app/films")!
    
    func listarFilmes() async throws -> [Filme] {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw FilmeApiError.invalidResponse
        }
        
        guard (200...299).contains(response.statusCode) else {
            throw FilmeApiError.httpError(response.statusCode)
        }
        
        return try JSONDecoder().decode([Filme].self, from: data)
    }
}
