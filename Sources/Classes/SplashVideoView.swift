//
//  SplashVideoView.swift
//  Pods
//
//  Created by junjie on 2020/1/19.
//

import UIKit
import AVKit

class SplashVideoView: UIView {
    let SplashVideoVC = AVPlayerViewController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let filePath = Bundle.main.path(forResource: "Splash4", ofType: ".mp4")
        let url = URL(fileURLWithPath: filePath!)
        SplashVideoVC.player = AVPlayer(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
