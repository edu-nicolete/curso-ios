//
//  TarefaFormModel.swift
//  ListaTarefas
//
//  Created by Augusto, Eduardo Henrique Nicolete on 06/11/26.
//

import Foundation

struct TarefaFormModel {
    
    var id: UUID? = nil
    var titulo: String = ""
    
    var tituloFormatado: String {
        titulo.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isValid: Bool {
        !tituloFormatado.isEmpty
    }
    
    mutating func clear() {
        titulo = ""
    }
    
    func converter() -> Tarefa? {
        if let idExistente = self.id {
            return Tarefa(id: idExistente, titulo: titulo)
        } else {
            return Tarefa(titulo: titulo)
        }
    }
}
