//
//  DashboardViewModel.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var items: [DataItem] = []

    func count(for status: StockStatus) -> Int {
        items.filter { $0.stockStatus == status }.count
    }
}


