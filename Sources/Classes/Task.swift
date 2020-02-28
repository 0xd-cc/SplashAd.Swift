//
//  Task.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/2/26.
//

import Foundation

class Task: Equatable, Executable, Cancelable {

    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func execute(_ completedHandler: (() -> Void)?) {
        abstractMethod()
    }
    
    func cancel() {
        abstractMethod()
    }
    
    
}
extension Task {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}


func abstractMethod(file: StaticString = #file, line: UInt = #line) -> Swift.Never {
    _fatalError("Abstract method", file: file, line: line)
}

func _fatalError(_ lastMessage: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Swift.Never  {
    fatalError(lastMessage(), file: file, line: line)
}

protocol Executable {
    func execute(_ completedHandler: (() -> Void)?)
}
