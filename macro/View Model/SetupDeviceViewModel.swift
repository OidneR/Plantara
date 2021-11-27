//
//  SetupDeviceViewModel.swift
//  macro
//
//  Created by Meichel Rendio on 24/11/21.
//

import Foundation
import SwiftUI
import CoreData

class SetupDeviceViewModel: ObservableObject{
    @Published var deviceName: String = ""
    @Published var lokasiTanaman: String = ""
    @Published var selectedDate = Date()
    @Published var jenisTanaman: String = ""
    let context = PersistenceController.shared.container.viewContext
    
    func saveData(){
        let device = DeviceData(context: context)
        device.lokasiTanaman = lokasiTanaman
        device.tanggalMenanam = selectedDate
        device.namaTanaman = jenisTanaman
        device.namaDevice = deviceName
        device.allowNotif = true
        device.allowNotifAir = true
        device.allowNotifSun = true
        device.allowNotifSoil = true
        device.allowNotifTemp = true
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("unsaved")
        }
        
    }
}
