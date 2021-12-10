//
//  PushNotificationSender.swift
//  macro
//
//  Created by Vincent on 06/12/21.
//

import Foundation
import FirebaseMessaging
import SwiftUI
import Firebase
import UIKit

class PushNotificationSender {

    func sendPushNotification(title: String, body: String) {
        let urlString = "https://fcm.googleapis.com/fcm/send"
        let url = NSURL(string: urlString)!
        let paramString: [String : Any] = ["to" : "f4W6evP_Vke7rbmmi35iVb:APA91bEq_8N28bRzJ4Lr-axLYXTSZsVE7JJB6FpGMuUJb32cSFV0gh-7zBaP7QgGZGXSwKu40Rp4FL8xEOjb6aJa0_hicY4WjIJhMcaViLiIRO4ELfV2aUmpJIP_7VnlWuXmJKD2OFn5",
                                           "notification": [
                                            "title" : title,
                                            "body" : body,
                                            "mutable_content" : true,
                                            "sound" : "Tri-tone"
                                           ]
                                          ]
        
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAAnMXvWI8:APA91bHsUCPhsqQgjD3QlKS3ouHeQP8XrXHC_xGdvUEh81AMwmP-6AuIJch82PQCRc4Ajtjc2tiSU3psfWS9sjs429FQrBaw2KeEcRfrZPRPLJ_sl0S9AM-0J_rF0slzo5G2bkhJnjlG", forHTTPHeaderField: "Authorization")
        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Received data:\n\(jsonDataDict)) ke kirim bos")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    }
    
    func createTopic(namaTopic: String){
        let urlString =  "https://iid.googleapis.com/iid/v1/diiMXZkkKkaYlGYw8_AdkX:APA91bGbMXTcRU6Di06Cjkl7bEH6TmM6-KECo-vNnjMZehDTPe22ltRNuv2dtW8XamgfftWpQqBqXABtgHp8jFiz0H44_NJc3YXSykztCynRzPTPFThTc1CuZ7zKXzwUiI_CWagUje5p/rel/topics/\(namaTopic)"
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AAAAnMXvWI8:APA91bHsUCPhsqQgjD3QlKS3ouHeQP8XrXHC_xGdvUEh81AMwmP-6AuIJch82PQCRc4Ajtjc2tiSU3psfWS9sjs429FQrBaw2KeEcRfrZPRPLJ_sl0S9AM-0J_rF0slzo5G2bkhJnjlG", forHTTPHeaderField: "Authorization")
        
        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Topic data:\n\(jsonDataDict))")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    }
}
