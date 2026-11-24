//
//  FilmeListView.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 23/11/26.
//

import SwiftUI
import SwiftData

struct FilmeListView: View {
    @State
    private var viewModel = FilmeViewModel()
    
    @State
    private var pesquisarForm = PesquisarFilmesFormModel()
    
    @Query
    private var favoritos: [FilmeFavorito]
    
    private var filtro: [Filme] {
        pesquisarForm.filter(viewModel.filmes)
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.carregando && viewModel.filmes.isEmpty {
                    ProgressView("Carregando filmes...")
                } else if let error = viewModel.mensagemErro, viewModel.filmes.isEmpty {
                    ContentUnavailableView {
                        Label("Erro ao carregar", systemImage: "wifi.exclamationmark")
                    } description: {
                        Text(error)
                    } actions: {
                        Button("Tentar novamente") {
                            Task {
                                await viewModel.carregaFilmes()
                            }
                        }
                    }
                } else if filtro.isEmpty {
                    ContentUnavailableView.search(text: pesquisarForm.pesquisar)
                } else {
                    List(filtro) { filme in
                        NavigationLink {
                            FilmeDetailView(filme: filme)
                        } label: {
                            FilmeCardView(filme: filme)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.carregaFilmes()
                    }
                }
            }
            .navigationTitle("Filmes disponiveis")
            .searchable(text: $pesquisarForm.pesquisar, prompt: "Pesquisar filmes")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "film.stack")
                        .foregroundStyle(.blue)
                }
            }
            .task {
                if viewModel.filmes.isEmpty {
                    await viewModel.carregaFilmes()
                }
            }
        }
    }
}
