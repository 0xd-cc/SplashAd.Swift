//
//  Configuration.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

private let margin = UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 70)

public enum SkipButtonPositionType {
    case topLeft
    case bottomLeft
    case topRight
    case bottomRight
    /// left: 左边距 top: 顶部距离
    case custom(left: CGFloat, top: CGFloat)
    
    var origin: (CGFloat, CGFloat) {
        switch self {
        case .topLeft:
            return (margin.left, margin.top)
        case .bottomLeft:
            return (margin.left, UIScreen.main.bounds.size.height - margin.top)
        case .topRight:
            return (UIScreen.main.bounds.size.width - margin.left, margin.top)
        case .bottomRight:
            return (UIScreen.main.bounds.size.width - margin.left, UIScreen.main.bounds.size.height - margin.top)
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
    public var skipButtonPosition: SkipButtonPositionType = .topRight
}
