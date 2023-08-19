//
//  SLQueueTestsWithLinkedList.swift
//  SLQueueTests
//
//  Created by Son Le on 30/07/2023.
//

import XCTest
@testable import SLQueue

final class SLQueueTests: XCTestCase {
    
    private var queue: SLQueue = .init()
    
    func testEnqueueWithSingleItem() {
        queue.enqueue(value: 1)
        
        XCTAssertFalse(queue.isEmpty)
    }
    
    func testEnqueueWithMultiItems() {
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        
        XCTAssertTrue(queue.size == 2)
    }
    
    func testDequeueWithEmptyQueue() {
        let val = queue.dequeue()
        
        XCTAssertNil(val)
    }
    
    func testDequeueWithNonEmptyQueue() {
        queue.enqueue(value: 5)
        
        let val = queue.dequeue()
        XCTAssertEqual(val, 5)
    }
    
    func testDequeueWithMultiItems() {
        queue.enqueue(value: 6)
        queue.enqueue(value: 7)
        queue.enqueue(value: 8)
        
        let val6 = queue.dequeue()
        let val7 = queue.dequeue()
        
        XCTAssertEqual(val6, 6)
        XCTAssertEqual(val7, 7)
        XCTAssertTrue(!queue.isEmpty)
    }
    
    func testHeadAndTailNil() {
        queue.enqueue(value: 10)
        queue.enqueue(value: 11)
        
        XCTAssertFalse(queue.isHeadNil)
        XCTAssertFalse(queue.isTailNil)
        
        queue.dequeue()
        queue.dequeue()
        
        XCTAssertTrue(queue.isHeadNil)
        XCTAssertTrue(queue.isTailNil)
    }
}
