//
//  DashboardViewModel.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//

import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    func count(for status: StockStatus, in items: [DataItem]) -> Int {
        items.filter { $0.stockStatus == status }.count
    }
    
    func items(for status: StockStatus, in items: [DataItem]) -> [DataItem] {
            items.filter { $0.stockStatus == status }
        }
}

