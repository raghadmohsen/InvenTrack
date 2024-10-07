//
//  Dashboard.swift
//  InvenTrack
//
//  Created by Reef Saeed on 06/10/2024.
//

import SwiftUI
fileprivate struct Item: Identifiable {
    var id: UUID = UUID()
    var name: String // Changed from title to name
}
struct Dashboard: View {
    @State fileprivate var list: [Item] = [
        Item(name: "View all"),
        Item(name: "Mac"),
        Item(name: "iPhone"),
        Item(name: "iPad"),
        Item(name: "Apple Watch"),
        Item(name: "Accessories"),
        // Add more names as needed
    ]
    @State fileprivate var dataID: Item.ID?
    
    @State var products = [
        Product(name: "MacBook Air", description: "MacBookAir15, M3", quantity: 20, imageName: "imv"),
        Product(name: "iPhone 16 Pro max", description: "Natural titanum, 256GB", quantity: 70, imageName: "iph"),
        Product(name: "iPad Pro", description: "iPad Pro 11inch WI-FI", quantity: 50, imageName: "ipd"),
        Product(name: "Apple AirPods", description: "Apple AirPods wirless bluetooth", quantity: 54, imageName: "air"),
        Product(name: "AirPods Max", description: "Professional-level active noise cancellation", quantity: 67, imageName: "head"),
        Product(name: "Apple Pencil", description: "Be creative by Apple pencil", quantity: 73, imageName: "pnc"),
        Product(name: "Apple Watch", description: "Apple Watch is the ultimate device for a healthy life", quantity: 94, imageName: "wch"),
    ]
    struct Product: Identifiable {
        var id = UUID()
        var name: String
        var description: String
        var quantity: Int
        var imageName: String
        
    }
    
    
    
    var body: some View {
        VStack(spacing : -200) {
                
                VStack {
                    HStack {
                        //                    Spacer(minLength: 0)
                        Text("Dashboard")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        
                            Text(Image(systemName: "plus.circle"))
                                .font(.title)
                                .padding()
                            .foregroundColor(.blue)
                    }
                    
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
            
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(list) { item in
                        let isSelected = item.id == dataID
                        Text(item.name) // Changed item.title to item.name
                            .padding(.all, 8)
                            .background(RoundedRectangle(cornerRadius: 8.0)
                                .fill(isSelected ? Color.gray : Color.gray1) // Adjust color as needed
                            )
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation {
                                    dataID = item.id
                                }
                            }
                            .accessibilityLabel(item.name) // Updated accessibility label
                    }
                }
                .scrollTargetLayout()
            }
            .padding(.all, 10)
            .scrollIndicators(.hidden)
            .onAppear {
                dataID = list.first?.id // Optional: Safely set the initial selection
            }
            
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(products){ product in
                        HStack {
                            // عرض الصورة الفريدة لكل منتج
                            Image(product.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .cornerRadius(20)
                                .clipped() // قص الصورة لتناسب الإطار
                                .padding(.trailing, 10) // إضافة مسافة بين الصورة والنص
                                .cornerRadius(3)
                            
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.system(size: 17))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 0.25)
                                    .foregroundColor(.black)
                                Text(product.description)
                                    .font(.system(size: 14))
                                    .padding(.bottom, 0.25)
                                    .foregroundColor(.dgray)
                                Text("Quantity: \(product.quantity)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.dgray)
                            }
                            /*.padding(.vertical)*/ // إضافة مسافة رأسية
                            
                            Spacer()
                            
                            // ثلاث نقاط (المزيد) داخل المستطيل
                            
                        }
                        /*.padding(.trailing)*/ // إضافة مسافة من اليمين
//                        .padding(.vertical)
                    }
                    .padding() // إضافة مسافة داخل المستطيل
                    .background(Color.gray.opacity(0.1))
                    .frame(width: 370, height: 100)
                    // خلفية للمستطيل
                    .cornerRadius(25) // جعل حواف المستطيل مستديرة
                }
            }
            //        .padding()
            
            
        }
        
        
        
    }
}
        

#Preview {
    Dashboard()
}
