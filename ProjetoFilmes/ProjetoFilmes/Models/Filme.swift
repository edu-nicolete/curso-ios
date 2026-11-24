//
//  Filme.swift
//  ProjetoFilmes
//
//  Created by Augusto, Eduardo Henrique Nicolete on 18/11/26.
//

import Foundation

struct Filme: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let originalTitle: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String
    let image: String?
    let movieBanner: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, image
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case movieBanner = "movie_banner"
    }
    
    var posterUrl: URL? {
        guard let image = image,
              let url = URL(string: image) else {
            print("URL invávlida para: \(title)")
            return nil
        }
        
        print("Filme: \(title)")
        print("Imgem: \(url.absoluteString)")
        
        return url
    }
    
    var bannerUrl: URL? {
        guard let movieBanner else {
            return nil
        }
        return URL(string: movieBanner)
    }
    
    var rating: Double {
        Double(rtScore) ?? 0
    }
}
