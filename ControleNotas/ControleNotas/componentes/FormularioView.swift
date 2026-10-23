//
//  FormularioView.swift
//  MyApp
//
//  Created by Augusto, Eduardo Henrique Nicolete on 22/10/26.
//

import SwiftUI

struct FormularioView: View {
    @Binding var nome: String
    @Binding var nota1: String
    @Binding var nota2: String
    
    let cadastrar: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Label("Cadastrar Aluno", systemImage: "person.badge.plus")
                .font(.headline)
            
            TextField("Nome: ", text: $nome)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Nota 1: ")
                        .font(.subheadline)
                    
                    TextField("0 a 10", text: $nota1)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Nota 2: ")
                        .font(.subheadline)
                    
                    TextField("0 a 10", text: $nota2)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            Button(action: cadastrar) {
                Label("Adicionar", systemImage: "plus.circle")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .glassEffect(in: .rect(cornerRadius: 30))
    }
}

