//
//  LivroDigital.swift
//  Biblioteca
//
//  Gerencia o livro digital com adicao do tamanho em MB e heranca de livro
//
//  Created by Augusto, Eduardo Henrique Nicolete on 09/10/26.
//

import Foundation

class LivroDigital: Livro {
    
    private(set) var tamanhoMb: Double
    
    init(titulo: String, autor: String, anoPublicacao: Int, tamanhoMb: Double) {
        self.tamanhoMb = tamanhoMb
        
        super.init(titulo: titulo, autor: autor, anoPublicacao: anoPublicacao)
    }
    
    override func exibirDetalhes() {
        super.exibirDetalhes()
        
        print("Livro Digital")
        print("Tamanho do arquivo: \(tamanhoMb) Mb")
    }
}
