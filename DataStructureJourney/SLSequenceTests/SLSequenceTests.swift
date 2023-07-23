//
//  SLSequenceTests.swift
//  SLSequenceTests
//
//  Created by Son Le on 23/07/2023.
//

import XCTest
@testable import SLSequence

struct Mock: SLArrayItem {
    var value: Int?
    
    init(_ value: Int?) {
        self.value = value
    }
}

final class SLSequenceTests: XCTestCase {
    
    private var array: SLArray<Mock> = .init([])
    
    override func setUp() {
        array = .init([
            .init(1),
            .init(2),
            .init(3),
            .init(4),
            .init(5),
        ])
        print("Setting up")
    }
    
    override func setUpWithError() throws {
        print("Setting up with error")
    }
    
    override func tearDown() {
        print("Tearing down")
    }
    
    override func tearDownWithError() throws {
        print("Tearing down with error")
    }
    
    override class func tearDown() {
        super.tearDown()
        print("Tearing down DONE")
    }
    
    func testGetItemAtIndex() {
        let item = array.get(at: 2)
        
        XCTAssertEqual(item.value!, 3)
    }
    
    func testInsertItemToLast() {
        let item: Mock = .init(6)
        array.push(item)
        
        XCTAssertTrue(array.size == 6)
        XCTAssertTrue(array.get(at: 5).value! == 6)
    }
    
    func testInsertItemAtSpecificIndexExceptLastIndex() {
        let item: Mock = .init(3)
        array.insert(item, at: 1)
        
        XCTAssertTrue(array.size == 6)
        XCTAssertEqual(array.get(at: 1).value!, 3)
    }
    
    func testInsertItemAtLastIndexWithInsertAtIndex() {
        let item: Mock = .init(6)
        array.insert(item, at: 5)
        
        XCTAssertTrue(array.size == 6)
        XCTAssertEqual(array.get(at: 5).value!, 6)
    }
    
    func testInsertItemAtSpecificIndexAndCheckOthersIndex() {
        let lastItem = array.get(at: array.size - 1)
        
        let item: Mock = .init(3)
        array.insert(item, at: 4)
        
        XCTAssertTrue(array.size == 6)
        XCTAssertEqual(array.get(at: 4).value!, 3)
        XCTAssertEqual(lastItem.value!, array.get(at: array.size - 1).value!)
    }
    
    func testInsertItemAtFirstIndexWithPrepend() {
        let currentSize = array.size
        array.prepend(.init(0))
        
        XCTAssertTrue(array.size == currentSize + 1)
    }
    
    func testPopItem() {
        let currentSize = array.size
        let lastItem = array.pop()
        
        XCTAssertTrue(array.size == currentSize - 1)
        XCTAssertEqual(lastItem!.value, 5)
    }
    
    func testDeleteFirstItemAndKeepNextItemCorrect() {
        array.delete(at: 0)
        
        XCTAssertTrue(array.size == 4)
        XCTAssertEqual(array.get(at: 0).value!, 2)
    }
    
    func testDeleteLastItemAndKeepPreviousItemCorrect() {
        array.delete(at: array.size - 1)
        
        XCTAssertTrue(array.size == 4)
        XCTAssertEqual(array.get(at: array.size - 1).value!, 4)
    }
    
    func testDeleteItemAtIndex() {
        array.delete(at: 3)
        
        XCTAssertTrue(array.size == 4)
    }
    
    func testRemoveSingleItem() {
        let currentSize = array.size
        let itemToRemove: Mock = .init(3)
        array.remove(itemToRemove)
        let sizeAfterRemove = array.size
        
        XCTAssertTrue(sizeAfterRemove == currentSize - 1)
    }
    
    func testRemoveMultipleItems() {
        array.push(.init(3))
        array.push(.init(6))
        array.push(.init(7))
        array.push(.init(3))
        
        let currentSize = array.size
        let itemToRemove: Mock = .init(3)
        array.remove(itemToRemove)
        let sizeAfterRemove = array.size
        
        XCTAssertTrue(sizeAfterRemove == currentSize - 3)
    }
    
    func testFindItemWhichContain() {
        let itemToFind: Mock = .init(5)
        let result = array.find(itemToFind)
        
        XCTAssertTrue(result == true)
    }
    
    func testFindItemWhichNotContain() {
        let itemToFind: Mock = .init(7)
        let result = array.find(itemToFind)
        
        XCTAssertTrue(result == false)
    }
}
