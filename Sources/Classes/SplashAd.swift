//
//  File.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/7.
//

open class SplashAd {
    public typealias ButtonTextFormatter = (_ leftTimeInterval: TimeInterval) -> String
    
    public static var configuration = Configuration()
    
    public static var buttonTextFormatter: ButtonTextFormatter = { leftTimeInterval in
        return String(format: " %d", leftTimeInterval) + " s"
    }
    
    public static var skipButtonGenerator: () -> UIButton = { 
        return UIButton(type: .custom)
    }
}
