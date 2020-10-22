//
//  TrieNode.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class TrieNode<T: Hashable> {
    var value: T?
    var children: [T: TrieNode] = [:]
    var ids = Set<Int>()
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func add(child: T, id: Int) {
        defer { children[child]?.setWordId(id) }
        
        guard children[child] == nil else {
            return
        }
        
        children[child] = TrieNode(value: child)
    }
    
    func setWordId(_ id: Int) {
        ids.insert(id)
    }
}
