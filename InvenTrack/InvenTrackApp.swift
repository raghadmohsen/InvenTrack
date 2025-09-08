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
    var body: some Scene {
        WindowGroup {
         
            DashboardView()
            
        }
    .modelContainer(for: [DataItem.self])
    }
}
