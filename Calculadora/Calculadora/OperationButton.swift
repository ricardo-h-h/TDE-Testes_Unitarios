//
//  OperationButton.swift
//  Calculadora
//
//  Created by Mark Joselli on 06/05/25.
//

import SwiftUI

struct OperationButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Circle())
        }
    }
}

#Preview {
    OperationButton(title: "+", action: {})
}
                


