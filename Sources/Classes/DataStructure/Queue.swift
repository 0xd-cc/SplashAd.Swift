//
//  Queue.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/2/26.
//

import Foundation

struct Queue<T> {
    typealias List = LinkedList<T>

    private var list = List()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
  
    mutating func enqueue(_ element: T) {
        list.append(element)
    }

    mutating func dequeue() -> T? {
        guard !list.isEmpty, let node = list.head else { return nil }
        list.remove(node: node)
        return node.value
    }
    
    mutating func clear() {
        list.removeAll()
    }

    func peek() -> T? {
        return list.head?.value
    }
}
