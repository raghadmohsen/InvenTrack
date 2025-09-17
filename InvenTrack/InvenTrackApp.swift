//
//  InvenTrackApp.swift
//  InvenTrack
//
//  Created by Reef Saeed on 06/10/2024.
//

import SwiftUI
import SwiftData

@main
struct InvenTrackApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    .modelContainer(for: [DataItem.self])
    }
}
