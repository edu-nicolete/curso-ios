//
//  Tarefa.swift
//  ListaTarefas
//
//  Created by Augusto, Eduardo Henrique Nicolete on 06/11/26.
//

import Foundation

struct Tarefa: Identifiable {
    
    var id = UUID()
    var titulo: String
    var isCompleto: Bool = false
}
