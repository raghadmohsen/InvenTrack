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
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        HStack {
            StockStatusButton(
                status: .inStock,
                count: viewModel.count(for: .inStock, in: items)            )
            .onTapGesture { router.go(.stockList(.inStock)) }

            StockStatusButton(
                status: .lowStock,
                count: viewModel.count(for: .lowStock, in: items)            )
            .onTapGesture { router.go(.stockList(.lowStock)) }

            StockStatusButton(
                status: .outOfStock,
                count: viewModel.count(for: .outOfStock, in: items)            )
            .onTapGesture { router.go(.stockList(.outOfStock)) }
        }
    }
}
