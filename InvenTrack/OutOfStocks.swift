//
//  OutOfStocks.swift
//  test
//
//  Created by Arwa Alqhtani on 04/04/1446 AH.
//

import SwiftUI
import SwiftData

struct OutOfStocks: View {
    @Query(sort: \DataItem.id) var dataitem: [DataItem]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    let outOfStockItems = dataitem.filter { $0.Quantity == 0 }
                    
                    ForEach(outOfStockItems) { item in
                        ItemCell(items: item)
                    }
                    .listRowBackground(
                        Capsule()
                            .fill(Color.gray.opacity(0.1))
                            .padding(.horizontal, 7)
                    )
                }
            }
            .navigationTitle("Out of Stock Items")
        }
    }
    
    struct ItemCell: View {
        let items: DataItem
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(items.Name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 1)
                
                Text("Quantity: \(items.Quantity)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
    
}

