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
    
    @Query(sort: \DataItem.id) var dataitems: [DataItem]
    
    var filteredItems: [DataItem] {
        dataitems.filter { $0.stockStatus == filterStatus }
    }
    
    var body: some View {
        List(filteredItems) { item in
            StockItemView(item: item, stockStatus: filterStatus)
        }
        .navigationTitle(filterStatus.title)
    }
}

