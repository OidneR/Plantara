//
//  macroApp.swift
//  macro
//
//  Created by Meichel Rendio on 25/10/21.
//

import SwiftUI

@main
struct macroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
