//
//  EPRApp.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

@main

struct EPRApp: App {
    let persistence = Persistence.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistence.save()
    }
}
