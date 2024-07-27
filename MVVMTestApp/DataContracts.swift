//
//  DataContracts.swift
//  MVVMTestApp
//
//  Created by Supraja on 27/07/24.
//

import Foundation

struct MovieModel {
    var name: String?
    var genere: String?
    var releaseYear: String?
    var language: String?
    var production: String?
    var director: String?
    var musicDirector: String?
    var actor: String?
    var actres: String?
    var cast: [String]?
    var poster: String?
    var ratting: String?
    
    var viewModel: MovieViewModel {
        MovieViewModel(name: name, year: releaseYear, director: director, poster: poster)
    }
}

struct MovieViewModel {
    var name: String?
    var year: String?
    var director: String?
    var poster: String?
}
