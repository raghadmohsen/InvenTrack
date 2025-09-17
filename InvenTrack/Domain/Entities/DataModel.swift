//
//  DataModel.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import Foundation
import SwiftData
    
@Model
class DataItem {
    
    @Attribute(.unique) var id : String
    var name : String
    var desc : String
    var category : String
    var quantity : Int
    var minQuantity : Int
    var inStock: Int?
    var lowStock: Int?
    var outOfStock: Int?
    
    var stockStatus: StockStatus {
           if quantity == 0 { return .outOfStock }
           if quantity <= minQuantity { return .lowStock }
           return .inStock
    }
       init(name: String ,desc: String, category : String , quantity : Int , minquantity : Int) {
        id = UUID().uuidString
        self.name = name
        self.desc = desc
        self.category = category
        self.quantity = quantity
        self.minQuantity = minquantity
       
    }
}

