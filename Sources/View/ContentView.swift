//
//  ContentView.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/7.
//
import AVFoundation
enum viewType {
    case video
    case image
}
class ContentView: UIView {
    private lazy var imageView: SplashImageView = {
        return SplashImageView()
    }()
    
    private lazy var videoView: SplashVideoView = {
        return SplashVideoView()
    }()
    
    lazy var skipButton: UIButton = {
        return SplashAd.skipButtonGenerator()
    }()
    
    private var eventCompleteHanlder: (Event) -> Void
    
    init(resource: ResourseType, eventCompleteHanlder: @escaping ((Event) -> Void)) {
        self.eventCompleteHanlder = eventCompleteHanlder
        super.init(frame: .zero)
        
        switch resource {
        case .url(url: let path):
            if judgeMVWithPath(Bundle.main.path(forResource: path, ofType: nil)!) {
                setupSubviews(type: .video)
                videoView.playVideo(by: path)
            } else {
                setupSubviews(type: .image)
                imageView.showLocalImage(name: path)
            }
            
            break
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///判断是否是视频
    func judgeMVWithPath(_ path: String) -> Bool {
        let asset = AVURLAsset(url: URL(fileURLWithPath: path), options: [:])
        let tracks = asset.tracks(withMediaType: .video)
        return tracks.count > 0
    }
    
    func setupSubviews(type: viewType) {
        if type == .video {
            addSubview(videoView)
            videoView.translatesAutoresizingMaskIntoConstraints = false
            videoView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        } else {
            addSubview(imageView)
            imageView.sizeToFit()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                imageView.topAnchor.constraint(equalTo: topAnchor),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            skipButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            skipButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        skipButton.isHidden = SplashAd.configuration.isSkipButtonHidden
        skipButton.addTarget(self, action: #selector(skip), for: .touchUpInside)
    }
    
    @objc private func skip() {
        eventCompleteHanlder(.skip)
    }
}

extension ContentView {
    enum Event {
        case skip
        case click(ad: ResourseType)
    }
}

fileprivate extension String {
    /// 从url中获取后缀 例：.png
    var pathExtension: String {
        guard let url = URL(string: self) else { return "" }
        return url.pathExtension.isEmpty ? "" : ".\(url.pathExtension)"
    }
}
