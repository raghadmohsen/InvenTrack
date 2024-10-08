//
//  LowStockPage.swift
//  InvenTrack
//
//  Created by Reef Saeed on 06/10/2024.
//

import SwiftUI

// نموذج بيانات للمنتج
struct Produc: Identifiable {
    var id = UUID()
    var name: String
    var quantity: Int
    var imageName: String
}

// نموذج بيانات للمخزون
class ProductInventory: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "iPhone 1", quantity: 4, imageName: "iphone"),
        Product(name: "iPad", quantity: 3, imageName: "ipad"),
    ]
}

struct LowStockPage: View {
    @ObservedObject var inventory = ProductInventory() // استخدام ال ObservableObject
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("Low Stock")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, -55)
                    .padding(.bottom, 20)
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(inventory.products) { product in
                            HStack {
                                Image(product.imageName)
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
                                
                                Button(action: {}) { // هذا الزر سيكون غير نشط
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
                                .contextMenu { // قائمة السياق
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
    LowStockPage()
}
