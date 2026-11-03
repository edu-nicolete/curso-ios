//
//  CardPacoteView.swift
//  AgenciaViagens
//
//  Created by Augusto, Eduardo Henrique Nicolete on 29/10/26.
//
import SwiftUI

struct CardPacoteView: View {
    let pacote: PacoteViagem
    let favoritado: Bool
    let alteraFavorito: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                Image(pacote.imagem)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 190)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                FavoritoView(favoritado: favoritado, acao: alteraFavorito)
                    .padding(10)
            }
            
            VStack(alignment: .leading, spacing: 7) {
                Text(pacote.titulo)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Label(pacote.destino, systemImage: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Label("\(pacote.diarias) diárias", systemImage: "moon.stars")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(pacote.precoFormatado)
                    .font(.title3.bold())
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
        }
        .padding(12)
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.15), lineWidth: 1)
        }
    }
}
