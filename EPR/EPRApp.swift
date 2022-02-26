//
//  EPRApp.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

@main
struct EPRApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
