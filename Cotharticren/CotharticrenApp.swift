//
//  CotharticrenApp.swift
//  Cotharticren
//
//  Created by Justin Venable on 7/13/21.
//

import SwiftUI

@main
struct CotharticrenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
