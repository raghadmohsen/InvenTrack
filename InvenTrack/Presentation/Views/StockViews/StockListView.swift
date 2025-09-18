//
//  StockListView.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//

import SwiftUI
import SwiftData


struct StockListView: View {
    let filterStatus: StockStatus
    @StateObject private var viewModel = DashboardViewModel()
    @Query(sort: \DataItem.id) var dataitems: [DataItem]
    
    var body: some View {
        let filteredItems = viewModel.items(for: filterStatus, in: dataitems)
        
        Group {
            if filteredItems.isEmpty {
                ContentUnavailableView(
                    label: {
                        Label("No items", systemImage: "tray")
                    },
                    description: {
                        Text("No \(filterStatus.title) items found.")
                    }
                )
            } else {
                List(filteredItems) { item in
                    StockItemView(item: item, stockStatus: filterStatus)
                }
            }
        }
        .navigationTitle(filterStatus.title)
        .onAppear {
            print("✅ StockListView for \(filterStatus.title) has appeared")
        }
    }
}
