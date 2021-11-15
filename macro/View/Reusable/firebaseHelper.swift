//
//  firebaseHelper.swift
//  macro
//
//  Created by Meichel Rendio on 10/11/21.
//

import Foundation
import Firebase
import FirebaseDatabase
import SwiftUI

class firebaseHelper {
    static var ref: DatabaseReference = Database.database(url: "https://esp8266-f04ee-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
    static var statusTanaman: StatusTanaman = StatusTanaman(kelembabanTanah: 0, kelembabanUdara: 0, suhu: 0)
    static func getDataFromFireBase(){
        ref.child("device1").observe(DataEventType.value) { DataSnapshot in
            guard let kelembabanTanah = DataSnapshot.childSnapshot(forPath: "kelembabanTanah").value as? Double else{return}
            guard let suhu = DataSnapshot.childSnapshot(forPath: "suhu").value as? Double else{return}
            guard let kelembabanUdara = DataSnapshot.childSnapshot(forPath: "kelembabanUdara").value as? Double else {return}
            statusTanaman.kelembabanTanah = kelembabanTanah
            statusTanaman.suhu = suhu
            statusTanaman.kelembabanUdara = kelembabanUdara
            print(statusTanaman)
        }
    }
    
    static func syncData()->StatusTanaman{
        var stats: StatusTanaman = StatusTanaman(kelembabanTanah: 0, kelembabanUdara: 0, suhu: 0)
        ref.child("device1").observe(DataEventType.value) { DataSnapshot in
            guard let kelembabanTanah = DataSnapshot.childSnapshot(forPath: "kelembabanTanah").value as? Double else{return}
            guard let suhu = DataSnapshot.childSnapshot(forPath: "suhu").value as? Double else{return}
            guard let kelembabanUdara = DataSnapshot.childSnapshot(forPath: "kelembabanUdara").value as? Double else {return}
            stats.kelembabanTanah = kelembabanTanah
            stats.suhu = suhu
            stats.kelembabanUdara = kelembabanUdara
            print(stats)
        }
        return stats
    }
}
