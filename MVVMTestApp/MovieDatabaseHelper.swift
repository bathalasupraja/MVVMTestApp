//
//  MovieDatabaseHelper.swift
//  MVVMTestApp
//
//  Created by Supraja on 22/07/24.
//

import Foundation


struct Movie: Codable {
    var poster: String?
    var title: String?
    //var language: String?
    var released: String?
    var type: String?
    var year: String?
    var director: String?
    var imdbID: String?
    
    enum CodingKeys: String, CodingKey {
        case poster = "Poster"
        case title = "Title"
        // case language = "Language"
        case released = "Released"
        case type = "Type"
        case year = "Year"
        case director = "Director"
        case imdbID = "imdbID"
    }
}

struct ResponseData: Codable {
    var response: String?
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case movies = "Search"
    }
}

class MovieDatabaseHelper {
    
    static var shared = MovieDatabaseHelper()
    
    private init() {
        
    }
    
    func getMovies() -> [MovieModel] {
        let movie1 = MovieModel(name: "Baahubali", releaseYear: "2022", director: "Rajamouli", poster: "bahubali"),
            movie2 = MovieModel(name: "Athadu", releaseYear: "2013", director: "Trivikram", poster: "athadu"),
            movie3 = MovieModel(name: "Orange", releaseYear: "2010", director: "Bhaskar", poster: "orange"),
            movie4 = MovieModel(name: "Magadeera", releaseYear: "2009", director: "Bhaskar", poster: "magadeera"),
            movie5 = MovieModel(name: "Rangastalam", releaseYear: "2018", director: "Sukumar", poster: "rangastalam"),
            movie6 = MovieModel(name: "Mahanati", releaseYear: "2018", director: "Nag ashwin", poster: "mahanati"),
            movie7 = MovieModel(name: "Kalki", releaseYear: "2024", director: "Nag ashwin", poster: "kalki"),
            movie8 = MovieModel(name: "Pushpa", releaseYear: "2021", director: "Sukumar", poster: "pushpa")
        return [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8]
    }
}
