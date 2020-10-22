//
//  Trie.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class Trie {
    typealias Node = TrieNode<Character>
    
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
    
    func insert(word: String, forId id: Int) {
        guard !word.isEmpty else { return }
        
        let words = word.components(separatedBy: " ")
        
        for currentWord in words {
            var currentNode = root
            
            for character in currentWord.lowercased() {
                if let child = currentNode.children[character] {
                    currentNode = child
                    currentNode.setWordId(id)
                } else {
                    currentNode.add(child: character, id: id)
                    currentNode = currentNode.children[character]!
                }
            }
        }
    }
    
    func findLastNode(ofWord word: String) -> Node? {
        guard !word.isEmpty else { return nil }
        
        var currentNode = root
        
        for character in word.lowercased() {
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                return nil
            }
        }
        
        return currentNode
    }
    
    func getMovieSuggestions(forWord word: String) -> [Int] {
        guard !word.isEmpty else { return [] }
        
        var suggestions = Set<Int>()
        
        let words = word.components(separatedBy: " ")
        for (index, currentWord) in words.enumerated() {
            guard !currentWord.isEmpty else {
                continue
            }

            guard let lastNode = findLastNode(ofWord: currentWord) else {
                return []
            }
            
            if index == 0 {
                suggestions.formUnion(lastNode.ids)
            } else {
                suggestions.formIntersection(lastNode.ids)
            }
        }
        
        return Array(suggestions)
    }
}
