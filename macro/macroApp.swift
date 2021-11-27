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
    @State var firebaseHelper: firebaseHelper
    @AppStorage("BackToMain") var backtomain:Bool = false
    
    init(){
        FirebaseApp.configure()
        firebaseHelper = macro.firebaseHelper()
        firebaseHelper.getDataFromFireBase()
    }
    
    var body: some Scene {
        WindowGroup {
            if(UIDevice.current.userInterfaceIdiom == .pad){
                MainPage(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }else if(backtomain){
                MainPage(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }else{
                MainPage(firebaseHelper:firebaseHelper, plantStatus: $firebaseHelper.statusTanaman)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
