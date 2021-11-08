//
//  macroApp.swift
//  macro
//
//  Created by Meichel Rendio on 25/10/21.
//

import SwiftUI
import Firebase
@main
struct macroApp: App {
    let persistenceController = PersistenceController.shared
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
