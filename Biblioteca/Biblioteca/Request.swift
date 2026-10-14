//
//  Documento.swift
//  Biblioteca
//
//  Protocol exigido
//
//  Created by Augusto, Eduardo Henrique Nicolete on 08/10/26.
//

/// Protocol com disponibilizacao do id e exibir detalhes

import Foundation

protocol Request {
    var id: UUID { get }
    
    func exibirDetalhes()
}
