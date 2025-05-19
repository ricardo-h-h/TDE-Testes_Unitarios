//
//  ContentView.swift
//  Calculadora
//
//  Created by Mark Joselli on 06/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var result: Double?
    
    // Formata o resultado para exibição na UI.
    var resultText: String {
        if let resultValue = result {
            if resultValue.truncatingRemainder(dividingBy: 1) == 0 {
                return "Resultado: \(String(format: "%.0f", resultValue))"
            } else {
                return "Resultado: \(String(format: "%.2f", resultValue))"
            }
        } else {
            return "Entrada inválida ou divisão por zero"
        }
    }
    
    // MARK: - Funções de Operação Matemática
    
    func sum(num1: Double?, num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 + n2
    }
    
    func subtract(num1: Double?, num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 - n2
    }
    
    func multiply(num1: Double?, num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        return n1 * n2
    }
    
    func divide(num1: Double?, num2: Double?) -> Double? {
        guard let n1 = num1, let n2 = num2 else { return nil }
        guard n2 != 0 else { return nil } // Previne divisão por zero
        return n1 / n2
    }
    
    // Processa a operação solicitada pela UI.
    func calculateResult(operation: (Double?, Double?) -> Double?) {
        let n1 = Double(number1) // Converte a entrada String para Double
        let n2 = Double(number2) // Converte a entrada String para Double
        result = operation(n1, n2)
    }

    // MARK: - Corpo da View
    var body: some View {
        VStack(spacing: 20) {
            Text("Calculadora SwiftUI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)

            NumberTextFieldView(title: "Número 1", number: $number1)
            NumberTextFieldView(title: "Número 2", number: $number2)
            
            HStack(spacing: 15) {
                OperationButton(title: "+") { calculateResult(operation: sum) }
                OperationButton(title: "-") { calculateResult(operation: subtract) }
                OperationButton(title: "*") { calculateResult(operation: multiply) }
                OperationButton(title: "/") { calculateResult(operation: divide) }
            }
            .padding(.vertical)

            Text(resultText)
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                .frame(maxWidth: .infinity)
                .background(result == nil ? Color.red.opacity(0.15) : Color.green.opacity(0.15))
                .cornerRadius(10)
                .animation(.easeInOut, value: resultText)
                .padding(.horizontal)
                
            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
