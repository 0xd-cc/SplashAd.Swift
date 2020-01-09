//
//  SceneDelegate.swift
//  Demo
//
//  Created by 0xd on 2020/1/9.
//  Copyright © 2020 0xd. All rights reserved.
//

import UIKit
import SplashAd_Swift

let url = URL(string: "https://cdn.pixabay.com/photo/2019/09/25/06/29/fire-4502710_1280.jpg")!
let gifURL = URL(string: "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .gray
        window?.makeKeyAndVisible()
        
        // 设置跳过按钮样式
        SplashAd.skipButtonGenerator = {
            let button = UIButton(type: .custom)
            button.titleLabel?.textColor = .white
            button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .light)
            return button
        }
        
        // 设置跳过按钮文字格式
        SplashAd.buttonTextFormatter = { leftTimeInterval in
            return String(format: "跳过 %.0f", leftTimeInterval) + " 秒"
        }
        // 设置广告时长
        SplashAd.configuration.duration = 3
        
        // 显示广告
        SplashAdManager.shared.showAd(with: Resourse(url: url), appWindow: window!)

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

