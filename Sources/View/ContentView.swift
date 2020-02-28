//
//  ContentView.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/7.
//

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
    
    init(resource: Resourse, eventCompleteHanlder: @escaping ((Event) -> Void)) {
        self.eventCompleteHanlder = eventCompleteHanlder
        super.init(frame: .zero)
        let postfix = resource.fileName.pathExtension
        switch postfix {
        case ".png", ".jpg", ".jpeg", ".gif":
            setupSubviews(type: "Image")
            imageView.showLocalImageOrGif(name: resource.fileName.components(separatedBy: postfix)[0], postfix: postfix)
        case ".mp4":
            setupSubviews(type: "Video")
            videoView.playVideo(by: resource.fileName)
        default:
            print("none")
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(type: String) {
        if type == "Video" {
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
