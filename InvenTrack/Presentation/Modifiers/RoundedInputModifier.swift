//
//  RoundedInputModifier.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//


import SwiftUI

struct RoundedInputModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(15)
            .padding(.horizontal)
    }
}

extension View {
    func roundedInputStyle() -> some View {
        self.modifier(RoundedInputModifier())
    }
}
