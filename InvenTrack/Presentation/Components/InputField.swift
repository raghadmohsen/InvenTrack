//
//  InputField.swift
//  InvenTrack
//
//  Created by Raghad on 05/09/2025.
//

import SwiftUI


struct InputField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .roundedInputStyle()
    }
}
