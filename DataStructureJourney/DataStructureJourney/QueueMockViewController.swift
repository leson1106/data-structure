//
//  QueueMockViewController.swift
//  DataStructureJourney
//
//  Created by Son Le on 31/07/2023.
//

import UIKit
import SLQueue

class SequenceMockViewController: UIViewController {
    let queue: SLQueue = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        queue.printQueue()
        queue.dequeue()
        queue.dequeue()
        queue.printQueue()
        queue.enqueue(value: 4)
        queue.enqueue(value: 5)
        queue.enqueue(value: 6)
        queue.printQueue()
    }
}
