//
//  ListaAlunosView.swift
//  MyApp
//
//  Created by Augusto, Eduardo Henrique Nicolete on 23/10/26.
//

import SwiftUI

struct ListaAlunosView: View {
    let aluno: Aluno
    let remover: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(aluno.nome)
                        .font(.headline)
                    
                    Text("Nota 1: \(formatar(aluno.nota1))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text("Nota 2: \(formatar(aluno.nota2))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text((formatar(aluno.media)))
                        .font(.title2.bold())
                    
                    Text(aluno.aprovado ? "Aprovado" : "Reprovado")
                        .font(.caption.bold())
                        .foregroundStyle(
                            aluno.aprovado ? .green : .red
                        )
                }
            }
            
            Divider()
            
            HStack {
                Spacer()
                
                Button(role: .destructive, action: remover) {
                    Label("Remover", systemImage: "trash")
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    private func formatar(_ valor: Double) -> String {
        valor.formatted(.number.precision(.fractionLength(1)))
    }
}
