//
//  ShowAdTask.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/2/28.
//

import Foundation

class ShowAdTask: Task {
    private let resource: Resourse
    private let appWindow: UIWindow
    
    init(id: String, resource: Resourse, appWindow: UIWindow) {
        self.resource = resource
        self.appWindow = appWindow
        super.init(id: id)
    }
    
    override func execute(_ completedHandler: (() -> Void)?) {
        SplashAdManager.shared.showAd(with:resource, appWindow: appWindow) { _ in
            completedHandler?()
        }
    }
    
    override func cancel() {
        SplashAdManager.shared.hide()
    }
}
