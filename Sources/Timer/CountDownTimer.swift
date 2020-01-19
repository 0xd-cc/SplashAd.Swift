//
//  CountDownTimer.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/1/9.
//

import Foundation

class CountdownTimer {
    typealias ValueChangedHandler = (CountdownTimer, _ currentValue: Double) -> Void
    
    private let internalTimer: DispatchSourceTimer
    
    private var isRunning = false
    
    private var currentValue: Double
    
    init(
        seconds: Double,
        interval: Double,
        leeway: DispatchTimeInterval = .seconds(0),
        queue: DispatchQueue = .main,
        valueChanged: ValueChangedHandler?,
        compelted: (() -> Void)?
    ) {
        currentValue = seconds + 1.0

        internalTimer = DispatchSource.makeTimerSource(queue: queue)
        internalTimer.setEventHandler { [weak self] in
            guard let self = self else {
                return
            }
            self.currentValue = self.currentValue - interval
            valueChanged?(self, self.currentValue)
            if self.currentValue <= 0 {
                compelted?()
                self.internalTimer.suspend()
            }
        }
        valueChanged?(self, self.currentValue)
        internalTimer.schedule(deadline: .now(), repeating: Double(interval), leeway: leeway)
    }
    
    @discardableResult
    func start() -> Self {
        if !isRunning {
            internalTimer.resume()
            isRunning = true
        }
        return self
    }
    
    @discardableResult
    func suspend() -> Self {
        if isRunning {
            internalTimer.suspend()
            isRunning = false
        }
        return self
    }
    
    deinit {
        if !self.isRunning {
            internalTimer.resume()
        }
        internalTimer.cancel()
    }
}
