//
//  CircularQueueMockViewController.swift
//  DataStructureJourney
//
//  Created by Son Le on 31/07/2023.
//

import UIKit
import SLQueue

class CircularQueueMockViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue: SLCircularQueue = .init(3)
//        let result: [Any] = [
//            queue.enQueue(6),
//            queue.Rear(),
//            queue.Rear(),
//            queue.deQueue(),
//            queue.enQueue(5),
//            queue.Rear(),
//            queue.deQueue(),
//            queue.Front(),
//            queue.deQueue(),
//            queue.deQueue(),
//            queue.deQueue(),
//        ]
        
//        let result: [Any] = [
//            queue.enQueue(1),
//            queue.enQueue(2),
//            queue.deQueue(),
//            queue.enQueue(3),
//            queue.deQueue(),
//            queue.enQueue(3),
//            queue.deQueue(),
//            queue.enQueue(3),
//            queue.deQueue(),
//            queue.Front()
//        ]
        
        let result: [Any] = [
            queue.enQueue(1),
            queue.enQueue(2),
            queue.enQueue(3),
            queue.enQueue(4),
            queue.Rear(),
            queue.isFull(),
            queue.deQueue(),
            queue.enQueue(4),
            queue.Rear()
        ]
        print(result)
    }
}
