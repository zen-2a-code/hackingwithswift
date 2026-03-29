//
//  SchedulingLocalNotificationsView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 24.03.26.
//

import NotificationCenter
import SwiftUI

struct SchedulingLocalNotificationsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Ask for notification permissions") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Nice! Spam away!")
                    } else if let error {
                        print("Ops the user didn't allow notifications, or something went wrong: \(error.localizedDescription)")
                    }
                }
            }
            
            Button("Schedule a notification triger") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    SchedulingLocalNotificationsView()
}
