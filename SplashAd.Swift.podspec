Pod::Spec.new do |s|
  s.name             = 'SplashAd.Swift'
  s.version          = '0.0.1'
  s.summary          = 'SplashAd.Swift 是使用 Swift 实现的 iOS 启动页广告框架。'
  s.swift_version    = '5.0'

  s.description      = <<-DESC
        `SplashAd.Swift` 是使用 `Swift` 实现的 `iOS` 启动页广告框架。
  DESC

  s.homepage         = 'https://github.com/0xd-cc/SplashAd.Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '0xd-cc' => 'i@0xd.cc' }
  s.source           = { :git => 'https://github.com/0xd-cc/SplashAd.Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'SplashAd.Swift/Classes/**/*'

end
