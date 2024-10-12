//
//  hapticManager.swift
//  hd3
//
//  Created by Abdulaziz Jamaleddin on 10/12/24.
//


import Foundation
import UIKit
import SwiftUI


class HapticManager: ObservableObject {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
