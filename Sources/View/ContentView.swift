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
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
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
