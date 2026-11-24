//
//  FilmeCardView.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 23/11/26.
//

import SwiftUI

struct FilmeCardView: View {
    let filme: Filme
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: filme.posterUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(let error):
                    Image(systemName: "photo.badge.exclamationmark")
                        .foregroundStyle(.red)
                        .onAppear {
                            print("Erro ao carregar imagem: \(error)")
                        }
                    
                @unknown default:
                    EmptyView()
                }
                
            } 
            .frame(width: 90, height: 130)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(filme.title)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Text(filme.releaseDate)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text("Diretor: \(filme.director)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                Label("\(Int(filme.rating))%",
                      systemImage: "star.fill"
                )
                .foregroundStyle(.orange)
                .font(.subheadline)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 5)
    }
}
