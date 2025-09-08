//
//  StockStatusOverview.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//


import SwiftUI
import SwiftData

struct StockStatusOverview: View {
    let items: [DataItem]
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        HStack {
            StockStatusButton(
                status: .inStock,
                count: viewModel.count(for: .inStock),
                destination: StockListView(filterStatus: .inStock)
            )
            StockStatusButton(
                status: .lowStock,
                count: viewModel.count(for: .lowStock),
                destination: StockListView(filterStatus: .lowStock)
            )
            StockStatusButton(
                status: .outOfStock,
                count: viewModel.count(for: .outOfStock),
                destination: StockListView(filterStatus: .outOfStock)
            )
        }
    }
}

