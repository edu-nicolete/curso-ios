//
//  TarefaViewModel.swift
//  ListaTarefas
//
//  Created by Augusto, Eduardo Henrique Nicolete on 06/11/26.
//

import Foundation
import Observation
import SwiftUI

@Observable
class TarefaViewModel {
    
    var tarefas: [Tarefa] = []
    
    var formularioCadastro = TarefaFormModel()
    
    func add(titulo: String) {
        let new = Tarefa(titulo: titulo)
        
        tarefas.append(new)
        
        
    }
    
    func editarStatus(tarefa: Tarefa) {
        guard let index = tarefas.firstIndex(
            where: { $0.id == tarefa.id }
        ) else {
            return
        }
        
        tarefas[index].isCompleto.toggle()
    }
    
    func remover(indice: IndexSet) {
        tarefas.remove(atOffsets: indice)
    }
}
