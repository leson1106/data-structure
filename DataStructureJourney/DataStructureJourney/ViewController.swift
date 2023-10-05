//
//  ViewController.swift
//  DataStructureJourney
//
//  Created by Son Le on 23/07/2023.
//

import UIKit
import SLSequence

struct PersonStruct {
    var age: Int = 0
    var name: String = ""
}

class PersonClass {
    var age: Int = 0
    var name: String = ""
    var note: Note = Note(content: "")
    
    init(age: Int, name: String, note: Note = Note(content: "")) {
        self.age = age
        self.name = name
        self.note = note
    }
}

class Note {
    var content: String
    
    init(content: String) {
        self.content = content
    }
}

class ViewController: UIViewController {
    
    var personS: PersonStruct = .init(age: 10, name: "Son")
    var personC: PersonClass = .init(age: 30, name: "Duong", note: Note(content: "Hi there!"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let memoS = MemoryAddress(of: &personS)
        let memoAgeS = MemoryAddress(of: &personS.age)
        let memoC = MemoryAddress(of: personC)
        let memoNoteInC = MemoryAddress(of: personC.note)
        print(memoS)
        print(memoAgeS)
        print(memoC)
        print(memoNoteInC)
        
        var numbers = [3,1,4,2]
        numbers.quicksort()
        print(numbers)
    }
}

struct MemoryAddress<T>: CustomStringConvertible {
    
    let intValue: Int
    
    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }
    
    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {
    
    // for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
        // or      Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}
