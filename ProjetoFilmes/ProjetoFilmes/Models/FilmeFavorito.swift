//
//  FilmeFavorito.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation
import SwiftData

@Model
final class FilmeFavorito {
    @Attribute(.unique)
    var id: String
    
    var title: String
    var originalTitle: String
    var movieDescription: String
    var director: String
    var producer: String
    var releaseDate: String
    var runningTime: String
    var rtScore: String
    var image: String?
    var movieBanner: String?
    
    init(filme: Filme) {
        self.id = filme.id
        self.title = filme.title
        self.originalTitle = filme.originalTitle
        self.movieDescription = filme.description
        self.director = filme.director
        self.producer = filme.producer
        self.releaseDate = filme.releaseDate
        self.runningTime = filme.runningTime
        self.rtScore = filme.rtScore
        self.image = filme.image
        self.movieBanner = filme.movieBanner
    }
    
    var movie: Filme {
        Filme(id: id, title: title, originalTitle: originalTitle, description: movieDescription, director: director, producer: producer, releaseDate: releaseDate, runningTime: runningTime, rtScore: rtScore, image: image, movieBanner: movieBanner)
    }
}
