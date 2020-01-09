

# SplashAd.Swift

`SplashAd.Swift` 是使用 `Swift` 实现的 `iOS` 启动广告框架。

> Splash Ads are transient static and video ad experiences that appear for five seconds when an app launches or a session resumes. These capture users' attention before they move to the requested content.
  
## Intro
  
* [ ] Core functions

* [ ] Document

* [ ] Gifs

* [ ] README_EN

* [ ] Swift UI
    
* [ ] Unit test


## Features

## Requirements

- iOS 10.0+ 
- Xcode 11.0+
- Swift 5+

## Installation

### CocoaPods

SplashAd.Swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SplashAd.Swift'
```

### Carthage

### Swift Package Manager


## Useage

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Then, in `SceneDelegate.Swift`:

```Swift
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
```
## License

`SplashAd.Swift` is released under the MIT license. [See LICENSE](./LICENSE) for details.
