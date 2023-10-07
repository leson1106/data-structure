//
//  SLHashMap.swift
//  SLHashSet
//
//  Created by Son Le on 18/08/2023.
//

import Foundation

private class Node {
    var key: Int
    var val: Int
    var next: Node?
    
    init(key: Int, val: Int, next: Node? = nil) {
        self.key = key
        self.val = val
        self.next = next
    }
}

///Simple HashMap data structure with fixed-size and linked list to handle collision
public class SLHashMap {
    
    private let size = 19997
    private var table: [Node?]
    
    public init() {
        table = Array(repeating: nil, count: size)
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        let node = Node(key: key, val: value, next: table[index])
        table[index] = node
    }
    
    func get(_ key: Int) -> Int? {
        let index = hash(key)
        var node = table[index]
        while node != nil {
            if node?.key == key {
                return node!.val
            }
            node = node?.next
        }
        return nil
    }
    
    func exists(_ key: Int) -> Bool {
        let val = get(key)
        return val != nil
    }
    
    func remove(_ key: Int) {
        let index = hash(key)
        var node = table[index]
        guard node != nil else { return }
        if node?.key == key {
            table[index] = node?.next
        } else {
            while node?.next != nil {
                if let nestedKey = node?.next?.key, nestedKey == key {
                    node?.next = node?.next?.next
                    return
                }
                node = node?.next
            }
        }
    }
}

private extension SLHashMap {
    func hash(_ key: Int) -> Int {
        return key * 12582917 % size
    }
}
