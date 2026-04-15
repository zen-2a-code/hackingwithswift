//
//  HapticManager.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 16.04.26.
//

import Foundation

import UIKit

enum HapticManager {
    static func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
}
