//
//  Configuration.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

private let leading: CGFloat = 20.0
private let top: CGFloat = 100
private let trailing: CGFloat = 70

public enum SkipButtonLocationType {
    case topLeft
    case bottomLeft
    case topRight
    case bottomRight
    /// left: 左边距 top: 顶部距离
    case custom(left: CGFloat, top: CGFloat)
    
    var location: (CGFloat, CGFloat) {
        switch self {
        case .topLeft:
            return (leading, top)
        case .bottomLeft:
            return (leading, UIScreen.main.bounds.size.height - top)
        case .topRight:
            return (UIScreen.main.bounds.size.width - trailing, top)
        case .bottomRight:
            return (UIScreen.main.bounds.size.width - trailing, UIScreen.main.bounds.size.height - top)
        case .custom(left: let left, top: let top):
            return (left, top)
        }
    }
}

public class Configuration {
    public var duration: Int = 3
    public var isSkipButtonHidden = false
    public var autoClose = true
    /// 默认位置右上
    public var skipButtonLocation: SkipButtonLocationType = .topRight
}
