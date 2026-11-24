//
//  FavoritosViewModel.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation
import Observation
import SwiftData

@MainActor
@Observable
final class FavoritosViewModel {
    var mensagemErro: String?
    
    func alterarFavorito(_ filme: Filme, context: ModelContext, favorito: Bool) {
        let repository = FavoritosRepository(context: context)
        
        do {
            if favorito {
                try repository.remover(filme.id)
            } else {
                try repository.adicionar(filme)
            }
            
            mensagemErro = nil
        } catch {
            mensagemErro = error.localizedDescription
        }
    }
    
    func removerFavorito(_ filme: Filme, context: ModelContext) {
        let repository = FavoritosRepository(context: context)
        
        do {
            try repository.remover(filme.id)
            
            mensagemErro = nil
        } catch {
            mensagemErro = error.localizedDescription
        }
    }
}
