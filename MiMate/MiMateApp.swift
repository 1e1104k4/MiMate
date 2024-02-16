//
//  MiMateApp.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import SwiftData
import SwiftUI

@main
struct MiMateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
