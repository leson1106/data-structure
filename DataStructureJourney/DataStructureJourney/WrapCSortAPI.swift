//
//  WrapCSortAPI.swift
//  DataStructureJourney
//
//  Created by Son Le on 05/10/2023.
//

import Foundation


class Box<A> {
    var unbox: A
    init(_ unbox: A) {
        self.unbox = unbox
    }
}

typealias Comparator = (UnsafeRawPointer?, UnsafeRawPointer?) -> Int32

func qsort_block(_ array: UnsafeMutableRawPointer, _ count: Int,
                 _ width: Int, _ compare: @escaping Comparator)
{
    let box = Box(compare) // 1
    let unmanaged = Unmanaged.passRetained(box) // 2
    defer {
        unmanaged.release() // 6
    }
    qsort_r(array, count, width, unmanaged.toOpaque()) {
        (ctx, p1, p2) -> Int32 in // 3
        let innerUnmanaged =
        Unmanaged<Box<Comparator>>.fromOpaque(ctx!) // 4
        let comparator = innerUnmanaged.takeUnretainedValue().unbox // 4
        return comparator(p1, p2) // 5
    }
}

extension Array where Element: Comparable {
    mutating func quicksort() {
        qsort_block(&self, self.count, MemoryLayout<Element>.stride) { a, b in
            let l = a!.assumingMemoryBound(to: Element.self).pointee
            let r = b!.assumingMemoryBound(to: Element.self).pointee
            if r > l { return -1 }
            else if r == l { return 0 }
            else { return 1 }
        }
    }
}
