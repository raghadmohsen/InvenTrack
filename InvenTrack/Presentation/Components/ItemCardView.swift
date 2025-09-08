//
//  ItemCardView.swift .swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI

struct ItemCardView: View {
    var items: DataItem
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text(items.name)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .padding(.bottom, 0.25)
                            .foregroundColor(.black)
                        Text(items.desc)
                            .font(.system(size: 14))
                            .padding(.bottom, 0.25)
                            .foregroundColor(.dgray)
                        Text("Quantity: \(items.quantity)")
                            .font(.system(size: 14))
                            .foregroundColor(.dgray)
                    }
                    
                    Spacer()
                    
                    
                }
                .padding()
                .frame(width: 370)
                .cornerRadius(30)
            }
        }
    }
}
