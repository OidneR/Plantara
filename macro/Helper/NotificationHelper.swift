//
//  NotificationHelper.swift
//  macro
//
//  Created by Meichel Rendio on 19/11/21.
//

import Foundation
import UserNotifications
import SwiftUI

class NotificationHelper {
    @State var isPresented: Bool = true
    func scheduleNotification(_ notif: UNMutableNotificationContent, sendAfter:Double){
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { settings in
            if settings.authorizationStatus == .notDetermined{
                UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (authed,err) in
                    if authed {
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: sendAfter, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notif, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }else if let error = err{
                        print(error.localizedDescription)
                    }
                }
            }else if settings.authorizationStatus == .denied{
                //https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
//                .alert(isPresented: $isPresented) {
//                     Alert (title: Text("Camera access required to take photos"),
//                            message: Text("Go to Settings?"),
//                            primaryButton: .default(Text("Settings"), action: {
//                                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                            }),
//                            secondaryButton: .default(Text("Cancel")))
//                        }
            }else{
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: sendAfter, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: notif, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        })
    }
}
