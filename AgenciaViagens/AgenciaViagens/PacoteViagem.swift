//
//  PacoteViagem.swift
//  AgenciaViagens
//
//  Created by Augusto, Eduardo Henrique Nicolete on 29/10/26.
//

import Foundation

struct PacoteViagem: Identifiable {
    
    let id = UUID()
    let titulo: String
    let destino: String
    let diarias: Int
    let dataPartida: String
    let dataRetorno: String
    let informacoesHotel: String
    let imagem: String
    let preco: Double
    
    var precoFormatado: String {
        preco.formatted(
            .currency(code: "BRL")
            .locale(Locale(identifier: "pt_BR"))
        )
    }
}

enum PacotesViagem {
    static let lista: [PacoteViagem] = [
        PacoteViagem(
            titulo: "Natal no Rio de Janeiro",
            destino: "Rio de Janeiro - RJ",
            diarias: 7,
            dataPartida: "22/12/2026",
            dataRetorno: "29/12/2026",
            informacoesHotel: "Hotel 4 estrelas em copacabana, café incluso, piscina e muito conforto.",
            imagem: "rio",
            preco: 4999.00),
        PacoteViagem(
            titulo: "Natal e ano novo no Rio de Janeiro",
            destino: "Rio de Janeiro - RJ",
            diarias: 15,
            dataPartida: "22/12/2026",
            dataRetorno: "06/01/2027",
            informacoesHotel: "Hotel 4 estrelas em copacabana, café incluso, piscina e muito conforto.",
            imagem: "rio",
            preco: 8999.00),
        PacoteViagem(
            titulo: "Uma semana em Nova York",
            destino: "Nova York - USA",
            diarias: 7,
            dataPartida: "07/01/2027",
            dataRetorno: "14/01/2027",
            informacoesHotel: "Hotel com cama de casal ou solteiro, café da manhã incluso, próximo a destinos turísticos.",
            imagem: "ny",
            preco: 7499.90),
        PacoteViagem(
            titulo: "Conheça Brasília",
            destino: "Brasília - DF",
            diarias: 5,
            dataPartida: "01/12/2026",
            dataRetorno: "05/12/2026",
            informacoesHotel: "Hotel 5 estrelas, próximo a esplanada dos ministérios com muito conforto, café incluso.",
            imagem: "bsb",
            preco: 3499.80),
        PacoteViagem(
            titulo: "Pé na areia em Salvador",
            destino: "Salvador - BA",
            diarias: 10,
            dataPartida: "12/11/2026",
            dataRetorno: "22/11/2026",
            informacoesHotel: "Hotel pé na areia, com muito conforto, all inclusive 24h.",
            imagem: "sal",
            preco: 5999.00)
    ]
}
