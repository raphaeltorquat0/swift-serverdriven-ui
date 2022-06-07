//
//  swift_serverdriven_uiApp.swift
//  swift-serverdriven-ui
//
//  Created by Raphael Torquato on 06/06/22.
//

import SwiftUI

@main
struct swift_serverdriven_uiApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            ContentView()
        }
    }
}
