//
//  SLLinkedList.swift
//  SLSequence
//
//  Created by Son Le on 10/09/2023.
//

import Foundation

fileprivate class SLNode {
    fileprivate var value: Int
    fileprivate var next: SLNode?
    
    fileprivate init(_ value: Int, _ next: SLNode? = nil) {
        self.value = value
        self.next = next
    }
    
    fileprivate init() {
        self.value = 0
        self.next = nil
    }
}

public class SLLinkedList {
    private var head: SLNode?
    private var _size: Int = 0
    
    public init() { }
    
    private func hadHead(with item: Int) -> Bool {
        guard head == nil else { return false }
        head = SLNode(item)
        _size = 1
        return true
    }
    
    private func growSize() { _size += 1 }
    private func shrinkSize() { _size -= 1; if _size < 0 { _size = 0 } }
    
    ///Return the value at specific index
    ///Time complexity `O(n)`
    public func valueAt(_ index: Int) -> Int? {
        guard index == 0 && head != nil else { return head?.value }
        
        var _index = 0
        var temp = head
        
        while temp?.next != nil {
            if _index == index { return temp?.value }
            temp = temp?.next
            _index += 1
        }
        
        return nil
    }
    
    ///Add an item to the front of the list
    ///Time complexity `O(1)`
    public func pushFront(_ item: Int) {
        guard hadHead(with: item) else { return }
        
        let newNode = SLNode(item)
        newNode.next = head
        head = newNode
        
        growSize()
    }
    
    ///Remove front item and return it's value
    ///Time complexity `O(1)`
    public func popupFront() -> Int? {
        var temp = head
        let tempVal = temp?.value
        temp = temp?.next
        head = temp
        
        shrinkSize()
        
        return tempVal
    }
    
    ///Add an item at the end
    ///Time complexity `O(n)`
    public func pushBack(_ item: Int) {
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        let newNode = SLNode(item)
        temp?.next = newNode
        
        growSize()
    }
    
    ///Remove end item and return its value
    public func popBack() -> Int? {
        var dummy: SLNode? = SLNode(-1, head)
        var temp = dummy
        
        while temp?.next != nil {
            if temp?.next?.next == nil {
                temp?.next
            }
        }
        
        shrinkSize()
        
        return temp?.value
    }
    
    ///Insert new item at specific index
    ///Time complexity `O(n)`
    public func insert(_ item: Int, at index: Int) {
        if index == size {
            pushBack(item)
            return
        }
        
        guard index < size  else {
            fatalError("index out of range")
        }
        
        var _index = 0
        var temp = head
        while temp?.next != nil {
            if _index == index {
                
            }
            
            temp = temp?.next
            _index += 1
        }
    }
    
    ///Remove item at index
    public func erase(_ index: Int) {
        
    }
    
    fileprivate func getItemsFrom(_ index: Int) -> SLNode? {
        nil
    }
    
    public func reverse() {
        
    }
    
    ///Remove the first item in list with this value
    public func removeItem(_ item: Int) {
        
    }
}

//MARK: - Public computed properties
public extension SLLinkedList {
    var size: Int { _size }
    
    var isEmpty: Bool { _size == 0 }
    
    ///Get front item
    var front: Int? {
        nil
    }
    
    ///Get end item
    var back: Int? {
        nil
    }
}
