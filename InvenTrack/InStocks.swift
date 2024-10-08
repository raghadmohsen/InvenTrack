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
                        itemcell(items: item)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("In Stock")
        }
    }
    
    struct itemcell: View {
        let items: DataItem
        var body: some View {
     
            VStack {
                VStack(spacing: 20) {
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(items.Name)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 0.25)
                                    .foregroundColor(.black)
                                Text(items.Desc)
                                    .font(.system(size: 14))
                                    .padding(.bottom, 0.25)
                                    .foregroundColor(.dgray)
                                Text("Quantity: \(items.Quantity)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.dgray)
                            }
                            
                            Spacer()
                            
                        
                    }
                    .padding()
                    //.background(Color.gray.opacity(0.1))
                    .frame(width: 370)
                    .cornerRadius(30)
                }
            }
        }
    }
}

