//
//  PesquisarFilmesFormModel.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation

struct PesquisarFilmesFormModel {
    var pesquisar: String = ""
    
    func filter(_ filmes: [Filme]) -> [Filme] {
        guard !pesquisar.isEmpty else {
            return filmes
        }
        
        return filmes.filter {
            $0.title.localizedCaseInsensitiveContains(pesquisar)
            || $0.director.localizedCaseInsensitiveContains(pesquisar)
            || $0.releaseDate.contains(pesquisar)
        }
    }
}
