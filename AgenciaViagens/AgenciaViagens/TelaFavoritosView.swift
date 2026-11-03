//
//  TelaFavoritosView.swift
//  AgenciaViagens
//
//  Created by Augusto, Eduardo Henrique Nicolete on 03/11/26.
//

import SwiftUI

struct TelaFavoritosView: View {
    
    @Binding
    var favoritos: Set<UUID>
    
    private var pacotesFavoritos: [PacoteViagem] {
        PacotesViagem.lista.filter {
            favoritos.contains($0.id)
        }
    }
    
    var body: some View {
        Group {
            if pacotesFavoritos.isEmpty {
                ContentUnavailableView("Nenhum favorito",
                systemImage: "heart", description: Text("Adicione algum pacote aos favoritos!"))
            } else {
                List {
                    ForEach(pacotesFavoritos) { pacote in
                        NavigationLink {
                            DetalhesView(pacote: pacote, favoritos: $favoritos)
                        } label: {
                            HStack(spacing: 12) {
                                Image(pacote.imagem)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 85)
                                    .clipped()
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(pacote.titulo)
                                        .font(.headline)
                                    
                                    Text(pacote.destino)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                    Text(pacote.precoFormatado)
                                        .font(.subheadline.bold())
                                        .foregroundStyle(.blue)
                                }
                                
                                Spacer(minLength: 0)
                            }
                            .padding(.vertical, 5)
                        }
                        .swipeActions {
                            Button("Remover", systemImage: "heart.slash", role: .destructive) {
                                favoritos.remove(pacote.id)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Meus favoritos")
    }
}
