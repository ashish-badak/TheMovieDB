//
//  DoublyLinkedList.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 23/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class DLLNode<T> {
    var data: T
    var previous: DLLNode<T>?
    var next: DLLNode<T>?
    
    init(data: T) {
        self.data = data
    }
}

final class DoublyLinkedList<T> {
    private var head: DLLNode<T>?
    private var tail: DLLNode<T>?
    
    private(set) var count: Int = 0
    
    func add(data: T) -> DLLNode<T> {
        let node = DLLNode(data: data)
        
        defer {
            head = node
            count += 1
        }

        guard let head = head else {
            tail = node
            return node
        }

        head.previous = node
        node.previous = nil
        node.next = head
        
        return node
    }
    
    func moveToHead(_ node: DLLNode<T>) {
        guard node !== head else { return }
        
        if node === tail {
            tail = node.previous
        }
        
        node.next?.previous = node.previous
        node.previous?.next = node.next
        node.next = head
        node.next?.previous = node
        
        node.previous = nil
        head = node
    }

    func removeLast() -> DLLNode<T>? {
        guard let absoluteNode = self.tail else { return nil }
        
        self.tail = absoluteNode.previous
        absoluteNode.previous?.next = nil
        absoluteNode.previous = nil
        
        if self.tail == nil {
            head = nil
        }
        
        count -= 1
        
        return absoluteNode
    }
}
