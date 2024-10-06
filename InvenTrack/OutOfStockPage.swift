//
//  OutOfStockPage.swift
//  InvenTrack
//
//  Created by Reef Saeed on 06/10/2024.
//

import SwiftUI

// نموذج بيانات للمنتج
struct Productr: Identifiable { // الاحتفاظ باسم Productr
    var id = UUID()
    var name: String
    var quantity: Int
    var imageName: String
}

// نموذج بيانات للمخزون
class ProductInventor: ObservableObject { // الاحتفاظ باسم ProductInventor
    @Published var products: [Productr] = [ // استخدام Productr
        Productr(name: "Apple Watch", quantity: 0, imageName: "watch"),
        Productr(name: "Airpods Max", quantity: 0, imageName: "head")
    ]
}

struct OutOfStockPage: View { // الاحتفاظ باسم OutOfStockPage
    @ObservedObject var inventory = ProductInventor() // استخدام ProductInventor
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Out Of Stock")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, -55)
                    .padding(.bottom, 20)
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(inventory.products) { product in
                            if product.quantity == 0 { // عرض المنتجات التي نفدت منها الكمية
                                HStack {
                                    Image(product.imageName) // استخدام imageName الصحيحة
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 90)
                                        .clipped()
                                        .padding(.trailing, 10)
                                        .cornerRadius(1)
                                    
                                    VStack(alignment: .leading) {
                                        Text(product.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        Text("Quantity: \(product.quantity)")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.vertical)
                                    
                                    Spacer()
                                    
                                    Button(action: {}) {
                                        HStack(spacing: 4) {
                                            Circle()
                                                .fill(Color.black)
                                                .frame(width: 6, height: 6)
                                            Circle()
                                                .fill(Color.black)
                                                .frame(width: 6, height: 6)
                                            Circle()
                                                .fill(Color.black)
                                                .frame(width: 6, height: 6)
                                        }
                                        .padding(.trailing)
                                        .padding(.vertical)
                                    }
                                    .contextMenu {
                                        Button(action: {
                                            print("Edit \(product.name)")
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        
                                        Button(role: .destructive, action: {
                                            if let index = inventory.products.firstIndex(where: { $0.id == product.id }) {
                                                inventory.products.remove(at: index)
                                            }
                                        }) {
                                            Label("Delete \(product.name)", systemImage: "trash")
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(25)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // إضافة إجراء زر العودة هنا
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.top, topPadding())
        }
    }
    
    private func topPadding() -> CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.windows.first?.safeAreaInsets.top ?? 0
        }
        return 0
    }
}

#Preview {
    OutOfStockPage()
}
