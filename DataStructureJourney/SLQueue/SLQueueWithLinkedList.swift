//
//  SLQueueWithLinkedList.swift
//  SLQueue
//
//  Created by Son Le on 30/07/2023.
//

fileprivate class SLNode {
    fileprivate var value: Int
    fileprivate var next: SLNode?
    
    fileprivate init(value: Int, next: SLNode? = nil) {
        self.value = value
        self.next = next
    }
}

public class SLQueue {
    
    private var head: SLNode?
    private var tail: SLNode?
    private var _size: Int = 0
    
    public init() { }
    
    public func enqueue(value: Int) {
        let newNode = SLNode(value: value)
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        _size += 1
    }
    
    @discardableResult
    public func dequeue() -> Int? {
        if let val = head?.value {
            head = head?.next
            
            if head == nil { tail = nil }
            _size -= 1
            
            return val
        } else {
            return nil
        }
    }
    
    public var isEmpty: Bool {
        _size == 0
    }
    
    public var isHeadNil: Bool {
        head == nil
    }
    
    public var isTailNil: Bool {
        tail == nil
    }
    
    public var size: Int {
        _size
    }
    
    public func printQueue() {
        var temp = head
        var str = ""
        while temp != nil {
            str += ("\(temp!.value)->")
            temp = temp?.next
        }
        print(str)
    }
}
