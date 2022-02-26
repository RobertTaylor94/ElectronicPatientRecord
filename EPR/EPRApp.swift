//
//  EPRApp.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

@main

struct EPRApp: App {
    let persistence = Persistence.previewFull
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
