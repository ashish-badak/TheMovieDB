//
//  MovieIndexer.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieIndexer {
    let trie: Trie
    var indexedMovies = [Int: Movie]()
    
    init() {
        trie = Trie()
    }
    
    func performIndexing(on movies: [Movie]) {
        movies.forEach { (movie) in
            trie.insert(word: movie.title, forId: movie.id)
            indexedMovies[movie.id] = movie
        }
    }
    
    func searchMovies(searchTerm: String) -> [Movie] {
        let movieIds = trie.getMovieSuggestions(forWord: searchTerm)
        return movieIds.compactMap { indexedMovies[$0] }
    }
}
