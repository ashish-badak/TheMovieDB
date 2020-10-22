//
//  LRUCache.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 23/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class LRUCache<Key: Hashable, Value> {
    final class CacheData {
        let key: Key
        let value: Value
        
        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }
    
    private let list = DoublyLinkedList<CacheData>()
    private var nodesDict = [Key: DLLNode<CacheData>]()
    
    private let capacity: Int

    init(capacity: Int = 5) {
        self.capacity = max(0, capacity)
    }
    
    func setValue(_ value: Value, for key: Key) {
        let data = CacheData(key: key, value: value)

        if let node = nodesDict[key] {
            node.data = data
            list.moveToHead(node)
        } else {
            let node = list.add(data: data)
            nodesDict[key] = node
        }

        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.data.key {
                nodesDict[key] = nil
            }
        }
    }
    
    func getAllValues() -> [Value] {
        return nodesDict.compactMap { $0.value.data.value }
    }
}
