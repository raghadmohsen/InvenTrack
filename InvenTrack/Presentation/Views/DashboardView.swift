//
//  Dashboard.swift
//  InvenTrack
//
//  Created by Raghad on 08/10/2024.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query(sort: \DataItem.id) var dataitem: [DataItem]
   // @Query(sort: [SortDescriptor(\DataItem.name, order: .forward)]) var dataitem: [DataItem]
    @Environment(\.modelContext) var Context
    @State private var isShowingItemSheet = false
    @State private var editItem : DataItem?
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                StockStatusOverview(items: dataitem)

            List{
                Section{
                    ForEach(dataitem) { items in
                        ItemCardView(items: items)
                            .onTapGesture {
                                editItem = items
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
        }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
            .onAppear{ print("Dashboard context:", _dataitem.modelContext)}
            .sheet(isPresented: $isShowingItemSheet){NewItemView()}
            .sheet(item: $editItem ){item in
                UpdateItem(editdata: item)
            }
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
                            isShowingItemSheet = true
                        }
                    })
                }
            }
        }
    }
}
