//
//  SLHashSet.swift
//  SLHashSet
//
//  Created by Son Le on 17/08/2023.
//

import Foundation

///Simple HashSet data structure with fixed-size and does not handle collisions
public class SLHashSet {
    private let defaultValue: Int = -1
    private let size: Int
    private var buckets: [Int]
    
    public init(_ size: Int) {
        self.size = size
        self.buckets = Array(repeating: defaultValue, count: size)
    }
    
    public func add(_ key: Int) {
        let index = hash(key)
        buckets[index] = key
    }
    
    public func remove(_ key: Int) {
        let index = hash(key)
        buckets[index] = defaultValue
    }
    
    public func contains(_ key: Int) -> Bool {
        let index = hash(key)
        return buckets[index] != defaultValue
    }
}

private extension SLHashSet {
    func hash(_ key: Int) -> Int {
        key % size
    }
}
