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
    
    fileprivate init(value: Int, next: SLNode? = nil) {
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
    
    public init() {
        head = SLNode.init()
    }
    
    ///Return the value at specific index
    public func valueAt(_ index: Int) -> Int? {
        nil
    }
    
    ///Add an item to the front of the list
    public func pushFront(_ item: Int) {
        
    }
    
    ///Remove front item and return it's value
    public func popupFront() -> Int? {
        nil
    }
    
    ///Add an item at the end
    public func pushBack(_ item: Int) {
        
    }
    
    ///Remove end item and return its value
    public func popBack() -> Int? {
        nil
    }
    
    ///Insert new item at specific index
    public func insert(_ item: Int, at index: Int) {
        
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
