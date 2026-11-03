//
//  FavoritoView.swift
//  AgenciaViagens
//
//  Created by Augusto, Eduardo Henrique Nicolete on 29/10/26.
//

import SwiftUI

struct FavoritoView: View {
    let favoritado: Bool
    let acao: () -> Void
    
    var body: some View {
        Button(action: acao) {
            Image(systemName: favoritado ? "heart.fill" : "heart")
                .font(.title3)
                .foregroundStyle(favoritado ? .red : .gray)
                .padding(8)
                .background(.white.opacity(0.95))
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}
