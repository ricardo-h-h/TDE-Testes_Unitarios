//
//  NumberTextFieldView.swift
//  Calculadora
//
//  Created by Mark Joselli on 06/05/25.
//
import SwiftUI

struct NumberTextFieldView: View {
    var title: String
    @Binding var number: String
    var body: some View {
        TextField(title, text: $number)
            .keyboardType(.numberPad)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

