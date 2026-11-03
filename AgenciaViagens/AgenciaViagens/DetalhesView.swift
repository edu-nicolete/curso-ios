//
//  DetalhesView.swift
//  AgenciaViagens
//
//  Created by Augusto, Eduardo Henrique Nicolete on 03/11/26.
//

import SwiftUI

struct DetalhesView: View {
    
    let pacote: PacoteViagem
    @Binding
    var favoritos: Set<UUID>
    
    private var favoritado: Bool {
        favoritos.contains(pacote.id)
    }
    var body: some View {
        ScrollView {
            VStack() {
                Image(pacote.imagem)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 260)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(pacote.titulo)
                        .font(.title.bold())
                    
                    Label(pacote.destino, systemImage: "mappin.and.ellipse")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Label("Partida: \(pacote.dataPartida)", systemImage: "airplane.departure")
                    Label("Retorno: \(pacote.dataRetorno)", systemImage: "airplane.arrival")
                    Label("\(pacote.diarias) diárias", systemImage: "moon.stars")
                    
                    Divider()
                    
                    Text("Hospedagem")
                        .font(.title3.bold())
                    
                    Text(pacote.informacoesHotel)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Preço do pacote")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text(pacote.precoFormatado)
                                .font(.title2.bold())
                                .foregroundStyle(.blue)
                        }
                        
                        Spacer()
                        
                        FavoritoView(favoritado: favoritado) {
                            alternar()
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label("Reservar por \(pacote.precoFormatado)", systemImage: "calendar.badge.check")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 14)
                            )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 100)
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Detalhes da viagem")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func alternar() {
        if favoritado {
            favoritos.remove(pacote.id)
        } else {
            favoritos.insert(pacote.id)
        }
    }
}

