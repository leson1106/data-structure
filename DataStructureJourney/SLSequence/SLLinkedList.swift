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
    
    private func setHead(with item: Int) {
        head = SLNode(item)
        _size = 1
    }
    
    private func growSize() { _size += 1 }
    private func shrinkSize() { _size -= 1; if _size < 0 { _size = 0 } }
    
    ///Return the value at specific index
    ///Time complexity `O(n)`
    public func valueAt(_ index: Int) -> Int? {
        var _index = 0
        var temp = head
        while temp != nil {
            if _index == index { return temp?.value }
            temp = temp?.next
            _index += 1
        }
        return nil
    }
    
    ///Add an item to the front of the list
    ///Time complexity `O(1)`
    public func pushFront(_ item: Int) {
        guard head != nil else {
            setHead(with: item)
            return
        }
        let newNode = SLNode(item)
        newNode.next = head
        head = newNode
        growSize()
    }
    
    ///Remove front item and return it's value
    ///Time complexity `O(1)`
    public func popFront() -> Int? {
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
        guard head != nil else {
            setHead(with: item)
            return
        }
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        let newNode = SLNode(item)
        temp?.next = newNode
        growSize()
    }
    
    ///Remove end item and return its value
    ///Time complexity `O(n)` in worse case, `O(1)` optimal when size <= 2
    public func popBack() -> Int? {
        _size > 2 ? _popBackWithLargeSize() : _popBackWithSmallSize()
    }
    
    private func _popBackWithSmallSize() -> Int? {
        guard head != nil else { return nil }
        defer { shrinkSize() }
        let temp = head
        if temp?.next != nil {
            let back = temp?.next?.value
            temp?.next = nil
            return back
        } else {
            let back = head?.value
            head = nil
            return back
        }
    }
    
    private func _popBackWithLargeSize() -> Int? {
        var temp = head
        while temp?.next?.next != nil {
            temp = temp?.next
        }
        let back = temp?.next?.value
        temp?.next = nil
        shrinkSize()
        return back
    }
    
    ///Insert new item at specific index
    ///Time complexity `O(n)`
    public func insert(_ item: Int, at index: Int) {
        guard index <= size else    { fatalError("index out of range") }
        if index == size            { pushBack(item); return }
        if index == 0               { pushFront(item); return }
        
        var _index = 1
        var temp = head
        while temp?.next != nil {
            if _index == index {
                let newNode = SLNode(item, temp?.next)
                temp?.next = newNode
                growSize()
                break
            }
            temp = temp?.next
            _index += 1
        }
    }
    
    ///Remove item at index
    ///Time complexity `O(n)`
    public func erase(_ index: Int) {
        guard index < size else { fatalError("index out of range") }
        if index == 0           { let _ = popFront(); return }
        if index == size - 1    { let _ = popBack(); return }
        var _index = 1
        var temp = head
        while temp?.next != nil {
            if _index == index {
                temp?.next = temp?.next?.next
                shrinkSize()
                break
            }
            temp = temp?.next
            _index += 1
        }
    }
    
    fileprivate func getItemsFrom(_ index: Int) -> SLNode? {
        nil
    }
    
    ///Time complexity `O(n)`
    public func reverse() {
        var curr = head
        var prev: SLNode?
        var next: SLNode?
        
        while curr != nil {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        head = prev
    }
    
    ///Remove the first item in list with this value
    ///Time complexity `O(n)`
    public func removeItem(_ item: Int) {
        guard item != head?.value else {
            erase(0)
            return
        }
        
        var temp = head
        while temp?.next != nil {
            if temp?.next?.value == item {
                temp?.next = temp?.next?.next
                shrinkSize()
                break
            }
            temp = temp?.next
        }
    }
}

//MARK: - Public computed properties
public extension SLLinkedList {
    var size: Int { _size }
    
    var isEmpty: Bool { _size == 0 }
    
    ///Get front item
    ///Time complexity `O(1)`
    var front: Int? { head?.value }
    
    ///Get end item
    ///Time complexity `O(n)`
    var back: Int? {
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        return temp?.value
    }
}
