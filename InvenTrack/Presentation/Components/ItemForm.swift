//
//  ItemForm.swift
//  InvenTrack
//
//  Created by Raghad on 02/09/2025.
//

import Foundation
import SwiftUI

// Reusable Form Component
struct ItemForm: View {
    @Binding var name: String
    @Binding var desc: String
    @Binding var category: String
    @Binding var quantity: Int
    @Binding var minQuantity: Int
    
    let buttonTitle: String
    let buttonAction: () -> Void

    var body: some View {
        VStack {
            
            InputField(placeholder: "Name", text: $name)
            InputField(placeholder: "Description", text: $desc)
            InputField(placeholder: "Category", text: $category)

            
            HStack {
                QuantityControl(title: "Quantity", value: $quantity)
                Spacer()
                QuantityControl(title: "Minimum Quantity", value: $minQuantity)
            }
            
            Spacer()
            
            PrimaryButton(title: buttonTitle){
                buttonAction()
            }
        }
    }
}

// Reusable Quantity Control
struct QuantityControl: View {
    let title: String
    @Binding var value: Int

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Color.black.opacity(0.75))
                .font(.caption)
                .cornerRadius(15)
                .padding(.horizontal,10)
                .padding(.top, 10)
                .frame(width: 155, height: 20, alignment: .leading)
            
            ZStack {
                Color.gray.opacity(0.15)
                    .frame(width: 148, height: 55)
                    .cornerRadius(15)
                    .padding(.horizontal)
                
                HStack {
                    Button(action: { if value > 0 { value -= 1 } }) {
                        Image(systemName: "minus")
                            .foregroundColor(Color.black)
                            .padding(.leading)
                            .padding(10)
                    }

                    TextField("0", value: $value, formatter: NumberFormatter())
                        .padding(1)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                            if let number = Int(value.description) {
                                value = number
                            } else {
                                value = 0
                            }
                        }

                    Button(action: { value += 1 }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.black)
                            .padding(.trailing)
                            .padding(10)
                    }
                }
            }
        }
    }
}
