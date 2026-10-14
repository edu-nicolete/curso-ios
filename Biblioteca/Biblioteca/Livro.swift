//
//  Livro.swift
//  Biblioteca
//
//  Gerencia o livro (crud de alteracao)
//
//  Created by Augusto, Eduardo Henrique Nicolete on 08/10/26.
//

import Foundation

class Livro: Request {
    let id: UUID
    private(set) var titulo: String
    private(set) var autor: String
    private(set) var anoPublicacao: Int
    private(set) var isEmprestado: Bool
    
    init(titulo: String, autor: String, anoPublicacao: Int, id: UUID = UUID()) {
        self.id = id
        self.titulo = titulo
        self.autor = autor
        self.anoPublicacao = anoPublicacao
        self.isEmprestado = false
    }
    
    func emprestar() {
        if isEmprestado {
            print("Este livro já está emprestado.")
        } else {
            print("Livro emprestado com sucesso.")
            self.isEmprestado = true
        }
    }
    
    func devolver() {
        if isEmprestado {
            print("Obrigado! Livro devolvido com sucesso.")
            self.isEmprestado = false
        } else {
            print("Houve um problema! Esse livro se encontra disponível.")
        }
    }
    
    func atualizar(_ livro: Livro) {
        self.titulo = livro.titulo
        self.autor = livro.autor
        self.anoPublicacao = livro.anoPublicacao
    }
    
    func exibirDetalhes() {
        print("""
            ----------------------------------------------------
            ID: \(id)
            Título: \(titulo)
            Autor: \(autor)
            Ano de Publicacao: \(anoPublicacao)
            Emprestado: \(isEmprestado ? "Sim" : "Não")
            ----------------------------------------------------
            """)
    }
}
