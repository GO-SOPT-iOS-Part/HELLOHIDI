//
//  ChannelModel.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/28.
//

import UIKit

struct PopularMovieRequest: Codable {
    let api_key: String
    let language: String?
    let page: Int?
}

// MARK: - PopularMovieResponse
struct PopularMovieResponse: Codable {
    let page: Int
    let results: [PopularResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage2
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage2: String, Codable {
    case en = "en"
    case fr = "fr"
    case nl = "nl"
}
