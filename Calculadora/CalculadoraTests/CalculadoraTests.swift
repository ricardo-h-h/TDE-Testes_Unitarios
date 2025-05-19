//
//  CalculadoraTests.swift
//  CalculadoraTests
//
//  Created by Mark Joselli on 06/05/25.
//

import XCTest
@testable import Calculadora // Permite acesso aos componentes do módulo principal

final class CalculadoraTests: XCTestCase {

    var contentView: ContentView!

    // Chamado antes de cada método de teste
    override func setUpWithError() throws {
        try super.setUpWithError()
        contentView = ContentView()
    }

    // Chamado após cada método de teste
    override func tearDownWithError() throws {
        contentView = nil // Libera a instância
        try super.tearDownWithError()
    }

    // MARK: - Testes de Soma
    func testSomarDoisNumerosPositivos() {
        let resultado = contentView.sum(num1: 5.0, num2: 3.0)
        XCTAssertEqual(resultado, 8.0, "Soma (5.0 + 3.0) deve ser 8.0")
    }

    func testSomarNumeroPositivoComZero() {
        let resultado = contentView.sum(num1: 7.0, num2: 0.0)
        XCTAssertEqual(resultado, 7.0, "Soma (7.0 + 0.0) deve ser 7.0")
    }

    func testSomarDoisNumerosNegativos() {
        let resultado = contentView.sum(num1: -2.0, num2: -4.0)
        XCTAssertEqual(resultado, -6.0, "Soma (-2.0 + -4.0) deve ser -6.0")
    }

    func testSomarComUmNil() {
        XCTAssertNil(contentView.sum(num1: 5.0, num2: nil), "Soma com segundo operando nil deve ser nil")
        XCTAssertNil(contentView.sum(num1: nil, num2: 3.0), "Soma com primeiro operando nil deve ser nil")
    }

    func testSomarComAmbosNil() {
        XCTAssertNil(contentView.sum(num1: nil, num2: nil), "Soma com ambos operandos nil deve ser nil")
    }

    // MARK: - Testes de Subtração
    func testSubtrairDoisNumerosPositivos() {
        let resultado = contentView.subtract(num1: 10.0, num2: 4.0)
        XCTAssertEqual(resultado, 6.0, "Subtração (10.0 - 4.0) deve ser 6.0")
    }

    func testSubtrairDeZero() {
        let resultado = contentView.subtract(num1: 0.0, num2: 5.0)
        XCTAssertEqual(resultado, -5.0, "Subtração (0.0 - 5.0) deve ser -5.0")
    }

    func testSubtrairNumeroNegativo() {
        let resultado = contentView.subtract(num1: 5.0, num2: -3.0)
        XCTAssertEqual(resultado, 8.0, "Subtração (5.0 - (-3.0)) deve ser 8.0")
    }

    func testSubtrairComUmNil() {
        XCTAssertNil(contentView.subtract(num1: 10.0, num2: nil), "Subtração com segundo operando nil deve ser nil")
        XCTAssertNil(contentView.subtract(num1: nil, num2: 4.0), "Subtração com primeiro operando nil deve ser nil")
    }

    func testSubtrairComAmbosNil() {
        XCTAssertNil(contentView.subtract(num1: nil, num2: nil), "Subtração com ambos operandos nil deve ser nil")
    }

    // MARK: - Testes de Multiplicação
    func testMultiplicarDoisNumerosPositivos() {
        let resultado = contentView.multiply(num1: 3.0, num2: 4.0)
        XCTAssertEqual(resultado, 12.0, "Multiplicação (3.0 * 4.0) deve ser 12.0")
    }

    func testMultiplicarPorZero() {
        XCTAssertEqual(contentView.multiply(num1: 7.0, num2: 0.0), 0.0, "Multiplicação (7.0 * 0.0) deve ser 0.0")
        XCTAssertEqual(contentView.multiply(num1: 0.0, num2: 7.0), 0.0, "Multiplicação (0.0 * 7.0) deve ser 0.0")
    }

    func testMultiplicarDoisNumerosNegativos() {
        let resultado = contentView.multiply(num1: -2.0, num2: -5.0)
        XCTAssertEqual(resultado, 10.0, "Multiplicação (-2.0 * -5.0) deve ser 10.0")
    }
    
    func testMultiplicarNumeroPositivoPorNegativo() {
        let resultado = contentView.multiply(num1: 2.0, num2: -5.0)
        XCTAssertEqual(resultado, -10.0, "Multiplicação (2.0 * -5.0) deve ser -10.0")
    }

    func testMultiplicarComUmNil() {
        XCTAssertNil(contentView.multiply(num1: 3.0, num2: nil), "Multiplicação com segundo operando nil deve ser nil")
        XCTAssertNil(contentView.multiply(num1: nil, num2: 4.0), "Multiplicação com primeiro operando nil deve ser nil")
    }

    func testMultiplicarComAmbosNil() {
        XCTAssertNil(contentView.multiply(num1: nil, num2: nil), "Multiplicação com ambos operandos nil deve ser nil")
    }

    // MARK: - Testes de Divisão
    func testDividirDoisNumerosPositivos() {
        let resultado = contentView.divide(num1: 10.0, num2: 2.0)
        XCTAssertEqual(resultado, 5.0, "Divisão (10.0 / 2.0) deve ser 5.0")
    }

    func testDividirPorZeroRetornaNil() {
        XCTAssertNil(contentView.divide(num1: 10.0, num2: 0.0), "Divisão por zero deve ser nil")
    }

    func testDividirZeroPorNumero() {
        let resultado = contentView.divide(num1: 0.0, num2: 5.0)
        XCTAssertEqual(resultado, 0.0, "Divisão (0.0 / 5.0) deve ser 0.0")
    }

    func testDividirDoisNumerosNegativos() {
        let resultado = contentView.divide(num1: -10.0, num2: -2.0)
        XCTAssertEqual(resultado, 5.0, "Divisão (-10.0 / -2.0) deve ser 5.0")
    }
    
    func testDividirNumeroPositivoPorNegativo() {
        let resultado = contentView.divide(num1: 10.0, num2: -2.0)
        XCTAssertEqual(resultado, -5.0, "Divisão (10.0 / -2.0) deve ser -5.0")
    }

    func testDividirComDividendoNil() {
        XCTAssertNil(contentView.divide(num1: nil, num2: 2.0), "Divisão com dividendo nil deve ser nil")
    }

    func testDividirComDivisorNil() {
        XCTAssertNil(contentView.divide(num1: 10.0, num2: nil), "Divisão com divisor nil deve ser nil")
    }

    func testDividirComAmbosOperandosNil() {
        XCTAssertNil(contentView.divide(num1: nil, num2: nil), "Divisão com ambos operandos nil deve ser nil")
    }
}
