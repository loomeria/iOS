//
//  UserNotifications.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 19/10/2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    init () {
        requestAuthorization()
    }
    
    func requestAuthorization() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { Settings in
            switch Settings.authorizationStatus {
            case .authorized:
                break
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, _ in
                    if success {
                        self.scheduleNotification()
                    }
                }
            case .denied:
                return
            case .provisional:
                return
            case .ephemeral:
                return
            @unknown default:
                return
            }
        }
    }
    
    func scheduleNotification() {
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Les Petits Createurs"
        content.body = "Nouvelle publication disponible"
        content.sound = .default
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "Les Petits Createurs", content: content, trigger: trigger)
        
        //notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.add(request)
        
    }
}
