//
//  FavoritosRepository.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation
import SwiftData

@MainActor
final class FavoritosRepository {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func adicionar(_ filme: Filme) throws {
        guard try !existeFilme(filme.id) else {
            return
        }
        
        context.insert(FilmeFavorito(filme: filme))
        try context.save()
    }
    
    func remover(_ movieId: String) throws {
        let descriptor = FetchDescriptor<FilmeFavorito>(
            predicate: #Predicate { $0.id == movieId}
        )
        
        let favoritos = try context.fetch(descriptor)
        
        for favorito in favoritos {
            context.delete(favorito)
        }
        
        try context.save()
    }
    
    func existeFilme(_ movieId: String) throws -> Bool {
        let descriptor = FetchDescriptor<FilmeFavorito>(
            predicate: #Predicate { $0.id == movieId }
        )
        
        return try !context.fetch(descriptor).isEmpty
    }
}
