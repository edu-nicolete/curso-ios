//
//  TarefaRowView.swift
//  ListaTarefas
//
//  Created by Augusto, Eduardo Henrique Nicolete on 06/11/26.
//

import SwiftUI

struct TarefaRowView: View {
    
    let tarefa: Tarefa
    let onToggle: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: tarefa.isCompleto ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(tarefa.isCompleto ? .green : .gray)
            }
            .buttonStyle(.plain)
            
            Text(tarefa.titulo)
                .strikethrough(tarefa.isCompleto)
                .foregroundStyle(tarefa.isCompleto ? .secondary : .primary)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
