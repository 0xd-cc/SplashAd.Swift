//
//  SplashAdManager.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

public class SplashAdManager {
    private var appWindow: UIWindow?
    private var timer: CountdownTimer?
    
    private lazy var adWindow: UIWindow = {
        if #available(iOS 13.0, *) {
            let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene}
            let keyWindowScene = windowScenes.first(where: {
                $0.windows.first(where: {$0.isKeyWindow}) != nil
            })
            guard let windowScene = keyWindowScene else {
                return UIWindow(frame: UIScreen.main.bounds)
            }
            return UIWindow(windowScene: windowScene)
        } else {
            return UIWindow(frame: UIScreen.main.bounds)
        }
    }()

    public static let shared = SplashAdManager()
    
    private init() {}
    
    public func showAd(with resourse: ResourseType, appWindow: UIWindow) {
        self.appWindow = appWindow
        adWindow.rootViewController = AdViewController()
        adWindow.makeKeyAndVisible()
//        switch resourse {
//        case .url(url: let path):
////            path///
//            break
//        }
        let contentView = ContentView(resource: resourse) { [weak self](event) in
            switch event {
            case .skip:
                self?.hide()
            case .click(let resource):
                self?.hide()
            }
        }
        
        adWindow.subviews.forEach({ $0.removeFromSuperview() })
        adWindow.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: adWindow.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: adWindow.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: adWindow.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: adWindow.bottomAnchor),
        ])

        timer = CountdownTimer(seconds: SplashAd.configuration.duration, interval: 1, leeway: .seconds(0), queue: .main, valueChanged: { (_, seconds) in
            contentView.skipButton.setTitle(SplashAd.buttonTextFormatter(TimeInterval(seconds)), for: .normal)
        }, compelted: { [weak self] in
            self?.hide()
        })
        timer?.start()
    }
    
    public func hide() {
        appWindow?.makeKeyAndVisible()
        adWindow.subviews.forEach({ $0.removeFromSuperview() })
    }
}
