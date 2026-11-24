//
//  FilmeDetailView.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 23/11/26.
//

import SwiftUI
import SwiftData

struct FilmeDetailView: View {
    let filme : Filme
    
    @Environment(\.modelContext)
    private var context
    
    @Query
    private var favoritos: [FilmeFavorito]
    
    @State
    private var favoritosViewModel = FavoritosViewModel()
    
    private var favorito: Bool {
        favoritos.contains { $0.id == filme.id }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: filme.bannerUrl) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .overlay {
                            Image(systemName: "film")
                                .font(.largeTitle)
                        }
                }
                .frame(height: 230)
                .clipped()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(filme.title)
                        .font(.largeTitle.bold())
                    
                    Text(filme.originalTitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 16) {
                        Label(filme.releaseDate, systemImage: "calendar")
                        
                        Label("\(filme.runningTime) min", systemImage: "clock")
                        
                        Label("\(Int(filme.rating))%", systemImage: "star.fill")
                            .foregroundStyle(.orange)
                    }
                    .font(.caption)
                    
                    Divider()
                    
                    Text("Sinopse")
                        .font(.title2.bold())
                    
                    Text(filme.description)
                        .font(.body)
                    
                    Divider()
                    
                    LabeledContent("Diretor", value: filme.director)
                    
                    LabeledContent("Produtor", value: filme.producer)
                    
                    Button {
                        favoritosViewModel.alterarFavorito(filme, context: context, favorito: favorito)
                    } label: {
                        Label(favorito ? "Remover dos favoritos" : "Adicionar aos favoritos",
                              systemImage: favorito ? "heart.slash.fill" : "heart.fill")
                        .frame(maxWidth: .infinity)
                        .padding(8)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(favorito ? .red : .blue)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Erro", isPresented: Binding(
            get: {
                favoritosViewModel.mensagemErro != nil
            },
            set: { if !$0 {
                favoritosViewModel.mensagemErro = nil
            }}
        )) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(favoritosViewModel.mensagemErro ?? "")
        }
    }
}
