//
//  DataRace.swift
//  DataStructureJourney
//
//  Created by Son Le on 09/10/2023.
//

import UIKit

//class MyData { }

struct MyData { }

class Node {
    var data = MyData()
}

class DataRaceMock: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let node = Node()
        
        let concurrentQueue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        for index in 0...1000 {
            concurrentQueue.async {
                node.data = MyData()
                
                withUnsafePointer(to: &node.data) {
                    print("Node data @ \($0)")
                }
                withUnsafePointer(to: node.data) {
                    print("Node data value no. \(index) @ \($0)")
                }
            }
        }
    }
}
