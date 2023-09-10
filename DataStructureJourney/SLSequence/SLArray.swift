//
//  SLArray.swift
//  SLSequence
//
//  Created by Son Le on 23/07/2023.
//

import Foundation

public protocol SLArrayItem {
    associatedtype Value: Equatable
    var value: Value? { get set }
    init(_ value: Value?)
}

public struct SLArray<Item: SLArrayItem> {
    
    private var elements: [Item] = []
    
    private let minimumCapacity: Int = 2
    private let shrinkCapacityCondition: Int = 4
    private let growCapacityCondition: Int = 2
    
    private var _size: Int = 0
    
    private var _capacity: Int = 2
    
    init() { }
    
    public init(_ items: [Item]) {
        _size = items.count
        resizeUp()
        
        elements = [Item](repeating: .init(nil), count: _size)
        
        for i in 0..<_size {
            elements[i] = items[i]
        }
    }
    
    ///Return item at index
    ///Time complexity `O(1)`
    public func get(at index: Int) -> Item {
        guard index < _size else {
            fatalError("index out of range")
        }
        return elements[index]
    }
    
    ///Push item to last
    ///Time complexity `O(1)`
    public mutating func push(_ item: Item) {
        _size += 1
        resizeUp()
        
        elements += [Item](repeating: .init(nil), count: 1)
        elements[_size - 1] = item
    }
    
    ///Insert an item at specific index
    ///Time complexity `O(1)` for index at the end & `O(n)` otherwise
    public mutating func insert(_ item: Item, at index: Int) {
        guard index <= _size else {
            fatalError("index out of range")
        }
        
        _size += 1
        resizeUp()
        
        elements += [Item](repeating: .init(nil), count: 1)
        //Shift all right items from index
        var i = _size - 1
        while i > index {
            elements[i] = elements[i - 1]
            i -= 1
        }
        elements[index] = item
    }
    
    ///Insert at index = 0
    ///Time complexity `O(n)`
    public mutating func prepend(_ item: Item) {
        insert(item, at: 0)
    }
    
    ///Pop the last item
    ///Time complexity `O(1)`
    public mutating func pop() -> Item? {
        guard _size > 0 else { return nil }
        
        let last = get(at: _size - 1)
        _size -= 1
        resizeDown()
        return last
    }
    
    ///Delete item at index then shift all left items
    ///Time complexity `O(n)` in worst case
    public mutating func delete(at index: Int) {
        guard index < _size else {
            fatalError("index out of range")
        }
        
        ///Last element, just pop
        if index == _size - 1 {
            _ = pop()
            return
        }
        
        for i in index..<_size - 1 {
            elements[i] = elements[i + 1]
        }
        
        _size -= 1
        resizeDown()
    }
    
    ///Looking for all matched item and remove it's indexes
    ///Time complexity`O(n)` Which n is current elements
    ///Space complexity `O(n)`
    public mutating func remove(_ item: Item) {
        var found: Int = 0
        var i = 0
        
        var newArray: SLArray<Item> = .init([])
        
        while i < _size {
            if let v1 = elements[i].value, let v2 = item.value, v1 == v2 {
                found += 1
            } else {
                newArray.push(elements[i])
            }
            i += 1
        }
        
        elements = newArray.elements
        _size -= found
        resizeDown()
    }
    
    ///Check if array contains item
    ///Time complexity `O(n)`
    public func find(_ item: Item) -> Bool {
        for i in 0..<_size where item.value == elements[i].value {
            return true
        }
        return false
    }
    
    ///Remove all elements
    public mutating func removeAll(_ keepingCapacity: Bool = false) {
        let emptyArray: SLArray<Item> = .init([])
        elements = emptyArray.elements
        _size = 0
        _capacity = keepingCapacity ? _capacity : minimumCapacity
    }
}

private extension SLArray {
    ///Reach capacity, resize to double of size
    mutating func resizeUp() {
        while self._capacity <= self._size {
            self._capacity = self._capacity * growCapacityCondition
        }
    }
    
    ///Popping/removing an item, if size equatl to 1/4 capacity, resize to half
    mutating func resizeDown() {
        guard _size <= (_capacity / shrinkCapacityCondition) else { return }
        
        self._capacity = max(minimumCapacity, _capacity / 2)
    }
}

//MARK: - Public computed properties
public
extension SLArray {
    //number of item
    var size: Int { _size }
    
    //number of item SLArray can hold
    var capacity: Int { _capacity }
    
    var isEmpty: Bool { size == 0 }
}
