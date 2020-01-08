#
# Be sure to run `pod lib lint SplashAd.Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SplashAd.Swift'
  s.version          = '0.0.1'
  s.summary          = 'SplashAd.Swift 是使用 Swift 实现的 iOS 启动页广告框架。'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
        `SplashAd.Swift` 是使用 `Swift` 实现的 `iOS` 启动页广告框架。
  DESC

  s.homepage         = 'https://github.com/0xd-cc/SplashAd.Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '0xd-cc' => 'i@0xd.cc' }
  s.source           = { :git => 'https://github.com/0xd-cc/SplashAd.Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SplashAd.Swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SplashAd.Swift' => ['SplashAd.Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
