//
//  TarefaView.swift
//  ListaTarefas
//
//  Created by Augusto, Eduardo Henrique Nicolete on 06/11/26.
//

import SwiftUI

struct TarefaView: View {
    
    @State
    private var viewModel = TarefaViewModel()
    
    @State
    private var formModel = TarefaFormModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack {
                    TextField(
                        "Digite uma nova tarefa",
                        text: $formModel.titulo
                    )
                    .textFieldStyle(.roundedBorder)
                    
                    Button {
                        viewModel.add(titulo: formModel.tituloFormatado)
                        
                        formModel.clear()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(formModel.isValid ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .disabled(!formModel.isValid)
                }
                .padding(.horizontal)
                
                List {
                    if viewModel.tarefas.isEmpty {
                        ContentUnavailableView(
                            "Nenhuma tarefa encontrada",
                            systemImage: "checklist",
                            description: Text("Adicione sua primeira tarefa.")
                        )
                    } else {
                        ForEach(viewModel.tarefas) { tarefa in
                            TarefaRowView(tarefa: tarefa, onToggle: { viewModel.editarStatus(tarefa: tarefa)
                            })
                        }
                        .onDelete(perform: viewModel.remover)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Tarefas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(viewModel.tarefas.count(where: { !$0.isCompleto })) tarefas a fazer")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    TarefaView()
}
