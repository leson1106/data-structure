//
//  SLLinkedListTests.swift
//  SLSequenceTests
//
//  Created by Son Le on 16/09/2023.
//

import XCTest
@testable import SLSequence

final class SLLinkedListTests: XCTestCase {
    
    func testGetValueAtIndexWithEmptyList() {
        let list = SLLinkedList()
        let val = list.valueAt(0)
        XCTAssertEqual(val, nil)
    }
    
    func testGetValueAtIndexWithNonEmptyList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        let val1 = list.valueAt(1)
        XCTAssertEqual(val1, 2)
        let val2 = list.valueAt(2)
        XCTAssertEqual(val2, 3)
    }
    
    func testGetValueAtIndexOutOfBounds() {
        let list = SLLinkedList()
        list.pushBack(1)
        let val = list.valueAt(1)
        XCTAssertEqual(val, nil)
    }
    
    func testPushFrontSingleElement() {
        let list = SLLinkedList()
        XCTAssertEqual(list.size, 0)
        list.pushFront(1)
        XCTAssertEqual(list.size, 1)
    }
    
    func testPushFrontMultiElements() {
        let list = SLLinkedList()
        let max = 10
        for i in 0..<max {
            list.pushFront(i)
        }
        XCTAssertEqual(list.size, max)
    }
    
    func testPopFrontWithEmptyList() {
        let list = SLLinkedList()
        let val = list.popFront()
        XCTAssertEqual(val, nil)
    }
    
    func testPopFrontWithExistElementAndRecheckSizeUntilEmpty() {
        let list = SLLinkedList()
        list.pushFront(1)
        
        XCTAssertEqual(list.popFront(), 1)
        XCTAssertEqual(list.size, 0)
        
        XCTAssertEqual(list.popFront(), nil)
        XCTAssertNotEqual(list.size, -1)
    }
    
    func testPushBackSingleElement() {
        let list = SLLinkedList()
        list.pushBack(1)
        XCTAssertEqual(list.size, 1)
    }
    
    func testPushBackMuiltiElements() {
        let list = SLLinkedList()
        let max = 10
        for i in 0..<max {
            list.pushBack(i)
        }
        XCTAssertEqual(list.size, max)
    }
    
    func testPopBackWithEmptyList() {
        let list = SLLinkedList()
        let val = list.popBack()
        XCTAssertEqual(val, nil)
    }
    
    func testPopBackWithExistElementAndRecheckSize() {
        let list = SLLinkedList()
        list.pushBack(10)
        XCTAssertEqual(list.size, 1)
        XCTAssertEqual(list.popBack(), 10)
        XCTAssertEqual(list.size, 0)
    }
    
    func testPopBackMultiTimesAndRecheckSizeUntilEmpty() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        
        XCTAssertEqual(list.popBack(), 3)
        XCTAssertEqual(list.size, 2)
        
        XCTAssertEqual(list.popBack(), 2)
        XCTAssertEqual(list.size, 1)
        
        XCTAssertEqual(list.popBack(), 1)
        XCTAssertEqual(list.size, 0)
        
        XCTAssertEqual(list.popBack(), nil)
        XCTAssertEqual(list.size, 0)
    }
    
    func testInsertItemAtSpecificIndexBetweenListSize() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(4)
        list.insert(3, at: 2)
        XCTAssertEqual(list.valueAt(2), 3)
        XCTAssertEqual(list.popBack(), 4)
    }
    
    func testInsertItemAtEndOfList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.insert(3, at: 2)
        XCTAssertEqual(list.valueAt(2), 3)
        XCTAssertEqual(list.popBack(), 3)
    }
    
    func testInsertItemAtFrontOfList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.insert(3, at: 0)
        XCTAssertEqual(list.valueAt(0), 3)
        XCTAssertEqual(list.popFront(), 3)
    }
    
    func testEraseItemAtSpecificIndex() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        list.pushBack(4)
        list.erase(1)
        XCTAssertEqual(list.size, 3)
        XCTAssertNotEqual(list.valueAt(1), 2)
    }
    
    func testRemoveElementInList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        list.pushBack(4)
        list.pushBack(5)
        list.removeItem(4)
        XCTAssertEqual(list.size, 4)
        XCTAssertEqual(list.popBack(), 5)
        XCTAssertEqual(list.popFront(), 1)
    }
    
    func testRemoveLastElementInList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        list.pushBack(4)
        list.pushBack(5)
        list.removeItem(5)
        XCTAssertEqual(list.size, 4)
        XCTAssertEqual(list.popBack(), 4)
    }
    
    func testRemoveFirstElementInList() {
        let list = SLLinkedList()
        list.pushBack(1)
        list.pushBack(2)
        list.pushBack(3)
        list.pushBack(4)
        list.pushBack(5)
        list.removeItem(1)
        XCTAssertEqual(list.size, 4)
        XCTAssertEqual(list.popFront(), 2)
    }
}
