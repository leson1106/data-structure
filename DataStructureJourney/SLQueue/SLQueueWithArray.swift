//
//  SLQueueWithArray.swift
//  SLQueue
//
//  Created by Son Le on 31/07/2023.
//

import Foundation

public class SLCircularQueue {
    
    private var defaultPointerValue: Int = -1
    private let capacity: Int
    private var size: Int = 0
    private var queue: [Int]
    private var reader: Int
    private var writer: Int
    
    public init(_ k: Int) {
        guard k >= 1 else {
            fatalError("Invalid queue size")
        }
        capacity = k
        queue = Array(repeating: -1, count: k)
        reader = 0
        writer = 0
    }
    
    public func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        queue[writer] = value
        size += 1
        if writer < capacity - 1 {
            writer += 1
        } else {
            writer = 0
        }
        return true
    }
    
    public func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        //Return temp as result if needed
        let temp = queue[reader]
        queue[reader] = defaultPointerValue
        size -= 1
        if reader < capacity - 1 {
            reader += 1
        } else {
            reader = 0
        }
        return true
    }
    
    public func Front() -> Int {
        if isEmpty() { return -1 }
        return queue[reader]
    }
    
    public func Rear() -> Int {
        if isEmpty() { return -1 }
        //Get latest value at previous `writer`
        return queue[writer == 0 ? capacity - 1 : writer - 1]
    }
    
    public func isEmpty() -> Bool {
        size == 0
    }
    
    public func isFull() -> Bool {
        size == capacity
    }
}

fileprivate extension SLCircularQueue {
    func resetPointer() {
        writer = 0
        reader = 0
    }
}
