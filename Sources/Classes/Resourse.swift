//
//  Resourse.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

public enum ResourseType {
    ///网络来源
    case url
    ///本地图片、gif、视频
    case local
//    case gif     //本地gif
//    case mp4     //本地mp4
    ///自定义
    case custom
}

public struct Resourse {
    public var resourceType: ResourseType
    public var fileName: String
    ///resourceType: 文件来源,  fileName:文件名包含后缀
    public init(resourceType: ResourseType, fileName: String) {
        self.resourceType = resourceType
        self.fileName = fileName
    }

}

