//
//  ShakeDetector.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

// ShakeDetector.swift
import SwiftUI

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .deviceShook, object: nil)
        }
    }
}

extension Notification.Name {
    static let deviceShook = Notification.Name("deviceShook")
}
