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

class firebaseHelper:ObservableObject {
    var ref: DatabaseReference = Database.database(url: "https://esp8266-f04ee-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
   // static var statusTanaman: StatusTanaman = StatusTanaman(kelembabanTanah: 0, kelembabanUdara: 0, suhu: 0)
    @Published var statusTanaman: StatusTanaman = StatusTanaman(kelembabanTanah: 0, kelembabanUdara: 0, suhu: 0)
    func getDataFromFireBase(){
        ref.child("device1").observe(DataEventType.value) { DataSnapshot in
            guard let kelembabanTanah = DataSnapshot.childSnapshot(forPath: "kelembabanTanah").value as? Double else{return}
            guard let suhu = DataSnapshot.childSnapshot(forPath: "suhu").value as? Double else{return}
            guard let kelembabanUdara = DataSnapshot.childSnapshot(forPath: "kelembabanUdara").value as? Double else {return}
            self.statusTanaman.kelembabanTanah = kelembabanTanah
            self.statusTanaman.suhu = suhu
            self.statusTanaman.kelembabanUdara = kelembabanUdara
        }
    }
}
