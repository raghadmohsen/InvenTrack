//
//  Dashboard.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    let onAddItem: () -> Void
    let onEditItem: (DataItem) -> Void
    
    @Query(sort: \DataItem.id) var dataitem: [DataItem]
    @Environment(\.modelContext) var Context
    
    var body: some View {
        VStack {
            StockStatusOverview(items: dataitem)
            List{
                Section{
                    ForEach(dataitem) { items in
                        ItemCardView(items: items)
                            .onTapGesture {
                                onEditItem(items)
                            }
                    }
                    .onDelete{indexSet in
                        for index in indexSet {
                            Context.delete(dataitem[index])
                        }
                    }
                }
            }
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing){
                Button(action : onAddItem) {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .overlay{
            if dataitem.isEmpty {
                ContentUnavailableView(
                    label: {
                        Label("NO ITEMS", systemImage: "exclamationmark.triangle")
                },description:{
                    Text("No items available. Please add some items.")
                },actions: {
                    Button(action : onAddItem) {
                        Text("Add Item")
                    }
                })
            }
        }
    }
}
