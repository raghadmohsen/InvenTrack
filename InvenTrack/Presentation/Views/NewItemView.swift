//
//  NewItemView.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct NewItemView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var Context
    
    @State private var name: String = ""
    @State private var category: String = ""
    @State private var quantity: Int = 0
    @State private var minQuantity: Int = 0
    @State private var desc : String = ""
    
    var body: some View {
        ItemForm(
            name: $name,
            desc: $desc,
            category: $category,
            quantity: $quantity,
            minQuantity: $minQuantity,
            buttonTitle: "Add",
            buttonAction: {
                let item = DataItem(name: name, desc: desc, category: category, quantity: quantity, minquantity: minQuantity)
                Context.insert(item)
                dismiss()
            }
        )
        .padding()
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing){
                Button("Cancel"){dismiss()}
            }
        }
    }
}
