//
//  Biblioteca.swift
//  Biblioteca
//
//  Gerencia a colecao de livro (CRUD)
//
//  Created by Augusto, Eduardo Henrique Nicolete on 08/10/26.
//

import Foundation

class Biblioteca {
    private var livros: [Livro] = []
    
    func cadastrarLivro(_ livro: Livro) {
        self.livros.append(livro)
        print("Livro cadastrado com sucesso!")
    }
    
    func listarLivros() {
        if livros.isEmpty {
            print("Nenhum livro cadastrado.")
        }
        for livro in livros {
            livro.exibirDetalhes()
        }
    }
    
    func buscarPorId(_ id: UUID) -> Livro? {
        let livro = livros.firstIndex(where: {$0.id == id})
        if livro != nil {
            return livros[livro!]
        }
        return nil
    }
    
    func buscarPorTitulo(_ titulo: String) -> [Livro] {
        return livros.filter{ $0.titulo.lowercased().contains(titulo.lowercased()) }
    }
    
    func removerLivro(_ id: UUID) {
        let index = livros.firstIndex(where: {$0.id == id})
        if index != nil {
            self.livros.remove(at: index!)
            print("Livro removido com sucesso!")
        }
    }
}
