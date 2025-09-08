//
//  StockStatusButton.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI


struct StockStatusButton<Destination: View>: View {
    let status: StockStatus
    let count: Int
    let destination: Destination
    
    private var title: String {
        switch status {
        case .inStock: return "In stock"
        case .lowStock: return "Low stock"
        case .outOfStock: return "Out of stock"
        }
    }
    
    private var color: Color {
        switch status {
        case .inStock: return .green1
        case .lowStock: return .orange1
        case .outOfStock: return .red1
        }
    }
    
    private var iconName: String {
        switch status {
        case .inStock: return "circle.fill"
        case .lowStock: return "circle.lefthalf.filled"
        case .outOfStock: return "minus.circle.fill"
        }
    }
    
    private var iconColor: Color {
        switch status {
        case .inStock: return .green
        case .lowStock: return .orange
        case .outOfStock: return .red
        }
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 10) {
                Text(title)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                HStack {
                    Text("\(count)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image(systemName: iconName)
                        .foregroundColor(iconColor)
                        .padding(.leading, 2)
                }
            }
            .frame(width: 80, height: 30)
            .padding(20)
            .background(color)
            .cornerRadius(15)
        }
    }
}

