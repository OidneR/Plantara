//
//  DataFromCoreData.swift
//  macro
//
//  Created by Meichel Rendio on 23/11/21.
//

import Foundation
import CoreData
import SwiftUI

class DataFromCoreData{
    static var context = PersistenceController.shared.container.viewContext
    @FetchRequest(
        entity: DeviceData.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \DeviceData.tanggalMenanam, ascending: true)
        ]
    ) static var data: FetchedResults<DeviceData>
}
