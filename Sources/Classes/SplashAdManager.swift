//
//  SplashAdManager.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

public class SplashAdManager {
    private var appWindow: UIWindow?
    private var timer: SwiftCountDownTimer?
    
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
        
        timer = SwiftCountDownTimer(interval: DispatchTimeInterval.fromSeconds(1), times: Int(SplashAd.configuration.duration), handler: { [weak self] (timer, count) in
            contentView.skipButton.setTitle(SplashAd.buttonTextFormatter(TimeInterval(count)), for: .normal)
        }, completed: { [weak self] in
            self?.hide()
        })
        timer?.reCountDown().suspend().start()
    }
    
    public func hide() {
        appWindow?.makeKeyAndVisible()
        adWindow.subviews.forEach({ $0.removeFromSuperview() })
    }
}

// MARK: Private functions
private extension SplashAdManager {
    func autoCloseIfNeeded() {
        guard SplashAd.configuration.autoClose,
            SplashAd.configuration.duration > 0 else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + SplashAd.configuration.duration) {
            self.hide()
        }
    }
}
