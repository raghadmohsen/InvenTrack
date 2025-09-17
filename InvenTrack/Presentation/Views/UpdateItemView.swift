//
//  UpdateItemView.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI

struct UpdateItem: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var editdata: DataItem
    
    var body: some View {
        ItemForm(
            name: $editdata.name,
            desc: $editdata.desc,
            category: $editdata.category,
            quantity: $editdata.quantity,
            minQuantity: $editdata.minQuantity,
            buttonTitle: "Save",
            buttonAction: { dismiss() }
        )
        .padding()
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing){
                Button("Cancel"){dismiss()}
            }
        }
    }
}

