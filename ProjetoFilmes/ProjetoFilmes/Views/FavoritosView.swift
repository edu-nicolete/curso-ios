//
//  FavoritosView.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 23/11/26.
//

import SwiftUI
import SwiftData

struct FavoritosView: View {
    @Environment(\.modelContext)
    private var context
    
    @Query(sort: \FilmeFavorito.title)
    private var favoritos: [FilmeFavorito]
    
    @State
    private var viewModel = FavoritosViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if favoritos.isEmpty {
                    ContentUnavailableView("Nenhum favorito",
                                           systemImage: "heart.slash",
                                           description: Text("Adicione filmes à sua lista de favoritos.")
                    )
                } else {
                    List {
                        ForEach(favoritos) { favorito in
                            NavigationLink {
                                FilmeDetailView(filme: favorito.movie)
                            } label: {
                                FilmeCardView(filme: favorito.movie)
                            }
                        }
                        .onDelete(perform: deletaFavoritos)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Meus favoritos")
            .alert("Erro",
                isPresented: Binding(
                    get: { viewModel.mensagemErro != nil },
                    set: { if !$0 { viewModel.mensagemErro = nil}}
                )
            ) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text(viewModel.mensagemErro ?? "")
            }
        }
    }
    
    private func deletaFavoritos(at offsets: IndexSet) {
        let filmes = offsets.map { favoritos[$0].movie }
        
        for filme in filmes {
            viewModel.removerFavorito(filme, context: context)
        }
    }
}
