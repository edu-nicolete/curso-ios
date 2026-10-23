//
//  FormularioView 2.swift
//  MyApp
//
//  Created by Augusto, Eduardo Henrique Nicolete on 22/10/26.
//


import SwiftUI

struct ResumoView: View {
    let totalAlunos: Int
    let totalAprovados: Int
    let totalReprovados: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Resumo da turma")
                .font(.headline)
            
            HStack(spacing: 12) {
                card("Alunos", totalAlunos, .blue)
                card("Aprovados", totalAprovados, .green)
                card("Reprovados", totalReprovados, .red)
                
            }
        }
    }
    
    private func card(_ titulo: String, _ quantidade: Int, _ cor: Color) -> some View {
        VStack(spacing: 8) {
            Text("\(quantidade)")
                .font(.title2.bold())
                .foregroundStyle(cor)
            
            Text(titulo)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .glassEffect(in: .rect(cornerRadius: 30))
    }
}
