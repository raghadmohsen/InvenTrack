//
//  DataModel.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import Foundation
import SwiftData
    
@Model class DataItem {
    
    @Attribute(.unique) var id : String
    var Name : String
    var Desc : String
    var Category : String
    var Quantity : Int
    var MinQuantity : Int
    
   
    //to pass in the name
    init(Name: String ,Desc: String, Category : String , Quantity : Int , Minquantity : Int) {
        id = UUID().uuidString
        self.Name = Name
        self.Desc = Desc
        self.Category = Category
        self.Quantity = Quantity
        self.MinQuantity = Minquantity
       
    }
}
