//
//  MainPageViewModel.swift
//  macro
//
//  Created by Meichel Rendio on 23/11/21.
//

import Foundation
import SwiftUI
import CoreData

class MainPageViewModel: ObservableObject{
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: DeviceData.entity(),
        sortDescriptors: [
            //NSSortDescriptor(keyPath: \DeviceData.tanggalMenanam, ascending: true)
        ]
    )var dataFatched: FetchedResults<DeviceData>
    
    init(){
        print(dataFatched)
    }
}
