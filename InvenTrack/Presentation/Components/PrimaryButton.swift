//
//  PrimaryButton.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(15)
        }
        .padding(.horizontal)
    }
}

