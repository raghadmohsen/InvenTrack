//
//  StockItemView.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI

enum StockStatus {
    case inStock, lowStock, outOfStock
    
    var label: String {
            switch self {
            case .inStock: return "In Stock"
            case .lowStock: return "Low Stock"
            case .outOfStock: return "Out of Stock"
            }
        }
    
        var title: String {
            switch self {
            case .inStock: return "In Stock"
            case .lowStock: return "Low Stock"
            case .outOfStock: return "Out of Stock"
            }
        }
}

struct StockItemView: View {
    let item: DataItem
    var stockStatus: StockStatus = .inStock
        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("Quantity: \(item.quantity)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}
