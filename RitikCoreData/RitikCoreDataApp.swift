//
//  RitikCoreDataApp.swift
//  RitikCoreData
//
//  Created by MD SHAFIQ PATEL on 12/11/21.
//

import SwiftUI

@main
struct RitikCoreDataApp: App {
    let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceContainer.container.viewContext)


        }
    }
}
