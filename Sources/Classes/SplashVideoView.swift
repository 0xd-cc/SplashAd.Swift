//
//  SplashVideoView.swift
//  Pods
//
//  Created by junjie on 2020/1/19.
//

import UIKit
import AVKit

class SplashVideoView: UIView {
    var SplashAVPlayer: AVPlayer!
    var playerLayer: AVPlayerLayer!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func playVideo(by fileName: String) {
        let filePath = Bundle.main.path(forResource: fileName, ofType:nil)
        let url = URL(fileURLWithPath: filePath!)
        SplashAVPlayer = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: SplashAVPlayer)
        self.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

        SplashAVPlayer.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
