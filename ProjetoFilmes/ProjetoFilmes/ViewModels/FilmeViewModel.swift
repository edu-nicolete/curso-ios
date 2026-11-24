//
//  FilmeViewModel.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class FilmeViewModel {
    var filmes: [Filme] = []
    var carregando = false
    var mensagemErro: String?
    
    private let service = FilmeService()
    
    func carregaFilmes() async {
        carregando = true
        mensagemErro = nil
        
        defer {carregando = false }
        
        do {
            filmes = try await service.listarFilmes().sorted {
                $0.title < $1.title
            }
        } catch {
            mensagemErro = error.localizedDescription
        }
    }
}
