//
//  Resourse.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation


public protocol ResourseType {
    var url: URL {get}
}


public struct Resourse: ResourseType {
    public var url: URL
    
    public init(url: URL) {
        self.url = url
    }
}

