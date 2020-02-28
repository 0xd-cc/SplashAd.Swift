//
//  AppDelegate.swift
//  SplashAd.Swift
//
//  Created by 0xd-cc on 01/14/2020.
//  Copyright (c) 2020 0xd-cc. All rights reserved.
//

import UIKit
import SplashAd_Swift

let url = URL(string: "https://cdn.pixabay.com/photo/2019/09/25/06/29/fire-4502710_1280.jpg")!
let gifURL = URL(string: "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif")!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .gray
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        
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
        // 设置 skip button 位置，默认位置为右上
        SplashAd.configuration.skipButtonLocation = .custom(left: UIScreen.main.bounds.size.width - 200, top: 300)
        // 显示广告
        SplashAdManager.shared.showAd(with: Resourse(url: url), appWindow: window!) { (event) in
            switch event {
            case .skip:
                print("skip")
            case .click(ad: let resource):
                print("URL String： \(resource.url.absoluteString)")
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
