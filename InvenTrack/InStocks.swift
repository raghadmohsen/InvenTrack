//
//  InStocks.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import SwiftUI
import SwiftData

struct InStocks: View {
    @Query(sort: \DataItem.id) var dataitem: [DataItem]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    let outOfStockItems = dataitem.filter { $0.Quantity > $0.MinQuantity }
                    
                    ForEach(outOfStockItems) { item in
                        itemell(items: item)
                    }
                    .listRowBackground(
                        Capsule()
                            .fill(Color.gray.opacity(0.1))
                            .padding(.horizontal, 7)
                    )
                }
            }
            .navigationTitle("In Stock")
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

struct itemell: View {
    let items: DataItem
    var body: some View {
 
        VStack {
            VStack(spacing: 20) {
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
                //.background(Color.gray.opacity(0.1))
                .frame(width: 370)
                .cornerRadius(30)
            }
        }
    }
}

