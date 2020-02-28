//
//  NotificationMonitor.swift
//  SplashAd.Swift
//
//  Created by 0xd on 2020/2/26.
//

import UIKit

class NotificationMonitor {
    static let share = NotificationMonitor()
    private init() {}
    
    private var taskPool: [Notification.Name : [Task]] = [:]
    private var taskQueue = Queue<Task>()
    
    func add(task: Task, for notification: ApplicationtNotification) {
        var tasks = taskPool[notification.name] ?? [Task]()
        tasks.append(task)
        taskPool[notification.name] = tasks
    }
    
    private func executeTasks() {
        guard let task = taskQueue.dequeue() else {
            return
        }
        task.execute(nil)
        executeTasks()
    }
}

// MARK: observe application notification
private extension NotificationMonitor {
    func addObserver() {
        ApplicationtNotification.allCases
            .map { $0.name }
            .forEach {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(recive(notification:)),
                                                       name: $0,
                                                       object: nil)
            }
    }
    
    @objc func recive(notification: Notification) {
        guard let tasks = taskPool[notification.name] else {
            return
        }
        taskQueue.clear()
        tasks.forEach {
            taskQueue.enqueue($0)
        }
        executeTasks()
    }
}

enum ApplicationtNotification: CaseIterable {
    case didEnterBackground
    case willEnterForeground
    case didFinishLaunching
    case didBecomeActive
    case willResignActive
    case didReceiveMemoryWarning
    case willTerminate
    case dignificantTimeChange
    case willChangeStatusBarOrientation
    
    var name: Notification.Name {
        switch self {
        case .didEnterBackground:
            return UIApplication.didEnterBackgroundNotification
        case .willEnterForeground:
            return UIApplication.willEnterForegroundNotification
        case .didFinishLaunching:
            return UIApplication.didFinishLaunchingNotification
        case .didBecomeActive:
            return UIApplication.didBecomeActiveNotification
        case .willResignActive:
            return UIApplication.willResignActiveNotification
        case .didReceiveMemoryWarning:
            return UIApplication.didReceiveMemoryWarningNotification
        case .willTerminate:
            return UIApplication.willTerminateNotification
        case .dignificantTimeChange:
            return UIApplication.significantTimeChangeNotification
        case .willChangeStatusBarOrientation:
            return UIApplication.willChangeStatusBarOrientationNotification
        }
    }
}
