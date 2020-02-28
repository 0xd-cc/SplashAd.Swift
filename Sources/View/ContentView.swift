//
//  ContentView.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/7.
//

class ContentView: UIView {
    private lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var skipButton: UIButton = {
        return SplashAd.skipButtonGenerator()
    }()
    
    private var eventCompleteHanlder: (Event) -> Void
    private var resourceType: ResourseType
    
    init(resource: ResourseType, eventCompleteHanlder: @escaping ((Event) -> Void)) {
        self.eventCompleteHanlder = eventCompleteHanlder
        self.resourceType = resource
        super.init(frame: .zero)
        setupSubviews()
        addTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(skipButton)
        layoutSkipButton()
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.isHidden = SplashAd.configuration.isSkipButtonHidden
        skipButton.addTarget(self, action: #selector(skip), for: .touchUpInside)
    }
    
    private func layoutSkipButton() {
        let left = SplashAd.configuration.skipButtonPosition.origin.0
        let top = SplashAd.configuration.skipButtonPosition.origin.1
        NSLayoutConstraint.activate([
            skipButton.leftAnchor.constraint(equalTo: leftAnchor, constant: left),
            skipButton.topAnchor.constraint(equalTo: topAnchor, constant: top),
            skipButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func addTapGesture() {
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizerHandle))
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func skip() {
        eventCompleteHanlder(.skip)
    }
    
    @objc private func tapGestureRecognizerHandle() {
        eventCompleteHanlder(.click(ad: self.resourceType))
    }
}
