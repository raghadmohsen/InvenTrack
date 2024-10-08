//
//  Dashbourd.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import SwiftUI
import SwiftData
import PhotosUI

struct Dashboard: View {
    
   
    @Query(sort: \DataItem.id) var dataitem: [DataItem]
    @Environment(\.modelContext) private var Context
    @State private var isShowingItemSheet = false
    @State private var itemToEdit: DataItem?
    
    
    var body: some View {
        NavigationStack{
            
                VStack {
                    
                    HStack {
                        
                        VStack(spacing: 10) {
                            
                            Text("In stock")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("9")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text(Image(systemName: "circle.fill"))
                                    .foregroundColor(.green)
                                
                                
                                .padding(.leading) } }
                        
                        .frame(width: 80, height: 30)
                        .padding(20)
                        .background(Color.green1)
                        .cornerRadius(15)
                        
                        
                        VStack(spacing: 10) {
                            
                            Text("Low stock")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("5")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text(Image(systemName: "circle.lefthalf.filled"))
                                    .foregroundColor(.orange)
                                
                                .padding(.leading) } }

                        .frame(width: 80, height: 30)
                        .padding(20)
                        .background(Color.orange1)
                        .cornerRadius(15)
                        
                        
                        VStack(spacing: 10) {
                            
                            Text("Out of stock")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack {
                                Text("3")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(Image(systemName: "minus.circle.fill"))
                                    .foregroundColor(.red)
                                
                                .padding(.leading) } }

                        .frame(width: 80, height: 30)
                        .padding(20)
                        .background(Color.red1)
                        .cornerRadius(15)
                        
                    }
                    //                    .padding()
                }
 
                
                
            List{
                Section{
                    ForEach(dataitem) { item in
                        itemcell(items: item)
                            .onTapGesture {
                                itemToEdit = item
                            }
                    }
                    
                    .onDelete{indexSet in
                        for index in indexSet {
                            Context.delete(dataitem[index])
                        }
                        
                    }
                }
                .padding(.horizontal)
            }

            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){NewItem()}
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button(action:{isShowingItemSheet=true}) {
                        Image(systemName: "plus.circle")
                            .padding(.top,30)
                    }
                }
                
            }
            .overlay{
                if dataitem.isEmpty {
                    ContentUnavailableView(label: {Label("NO ITEMS", systemImage: "exclamationmark.triangle")
                    },description:{
                        Text("No items available. Please add some items.")
                    },actions: {
                        Button("Add Item") {
                            isShowingItemSheet=true
                        }
                    })
                    .offset(y: -60)
                }
            }
            
        }//nav
        
    }//body
}// main struct
    
    
struct itemcell: View {
    let items: DataItem
    var body: some View {
 
        VStack {
            VStack(spacing: 20) {
                    HStack {
                        // عرض الصورة الفريدة لكل منتج
                       
                        
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
    





#Preview {
    Dashboard()
}


struct NewItem: View {
    //access the database
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var Context
    @Query private var items: [DataItem]
    //@Query private var items: [DataItem]
    
    // State variables to hold the data entered by the user
    @State private var name: String = ""
    @State private var category: String = ""
    @State private var quantity: Int = 0
    @State private var minQuantity: Int = 0
    @State private var desc : String = ""

    var body: some View {
        NavigationStack {
                
            
            VStack {
                VStack{
                    // TextField for Name
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    //TextField for Description
                    TextField("Description", text: $desc)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    
                    // TextField for Category
                    TextField("Category", text: $category)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    // Quantity controls
                    HStack {
                        
                        
                        VStack/*(spacing:-13)*/ {
                            
                            Text("Quantitie")// Misspelled as per the image
                                .foregroundColor(Color.black.opacity(0.75))
                                .font(.caption)
                                .cornerRadius(15)
                                .padding(.horizontal,10)
                                .padding(.top, 10)
                                .frame(width: 155, height: 20,alignment: .leading)
                            
                            HStack {
                                ZStack {
                                    
                                    Color.gray.opacity(0.15)
                                        .frame(width: 148, height: 55)
                                        .cornerRadius(15)
                                        .padding(.horizontal)
                                    
                                    HStack {
                                        
                                        
                                        Button(action: {
                                            if quantity > 0 {
                                                quantity -= 1
                                            }
                                        }) {
                                            Image(systemName: "minus")
                                                .foregroundColor(Color.black)
                                                .padding(.leading)
                                                .padding(10)
                                            
                                        }
                                        
                                        TextField("0", value: $quantity, formatter: NumberFormatter())
                                            .padding(1)
                                            .multilineTextAlignment(.center)
                                            .keyboardType(.numberPad)
                                            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                                                if let text = quantity.description as String?, let number = Int(text) {
                                                    quantity = number
                                                } else {
                                                    quantity = 0 // or handle invalid input differently
                                                }
                                            }
                                        //                                        Text("\(quantity)")
                                        Button(action: {
                                            quantity += 1
                                        }) {
                                            Image(systemName: "plus")
                                                .foregroundColor(Color.black)
                                                .padding(.trailing)
                                                .padding(10)
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Minimun quantitie")
                                .foregroundColor(Color.black.opacity(0.75))
                                .font(.caption)
                                .cornerRadius(15)
                                .padding(.horizontal,10)
                                .padding(.top, 10)
                                .frame(width: 155, height: 20,alignment: .leading)
                            
                            ZStack {
                                Color.gray.opacity(0.15)
                                    .frame(width: 148, height: 55)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                
                                HStack {
                                    Button(action: {
                                        if minQuantity > 0 {
                                            minQuantity -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(Color.black)
                                            .padding(.leading)
                                            .padding(10)
                                        
                                    }
                                    
                                    TextField("0", value: $minQuantity, formatter: NumberFormatter())
                                        .padding(1)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                        .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                                            if let text = minQuantity.description as String?, let number = Int(text) {
                                                minQuantity = number
                                            } else {
                                                quantity = 0 // or handle invalid input differently
                                            }
                                        }
                                    
                                    //Text("\(minQuantity)")
                                    Button(action: {
                                        minQuantity += 1
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(Color.black)
                                            .padding(.trailing)
                                            .padding(10)
                                        
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    Spacer()
                    
                    // Add Button
                    Button(action: {
                        // Handle add action
                        let item = DataItem(Name: name,Desc: desc ,Category: category, Quantity: quantity, Minquantity: minQuantity)
                        Context.insert(item)
                        dismiss()
                        
                    }) {
                        Text("Add")
                            .padding()
                            .frame(width: 155, height: 48)
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(15)
                            .padding(.bottom)
                    }
                }
                    .padding()
                }//input vstack end
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Cancel"){dismiss()}
                        .padding(.top)
                        .padding(.horizontal)
                }
            }//tool bar
        }
    }//body
}//main sruct
