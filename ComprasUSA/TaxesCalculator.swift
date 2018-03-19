//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Eduardo Tarallo on 15/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    // Declarando as variaveis
    
    var dolar: Double = 3.50
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    let formatter = NumberFormatter()
    
    
    // Criação de variaveis compudatas
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    
    // Metodo Cálcular
    
    func calculate(usingCreditCard: Bool) -> Double{
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    // Metodo de Conversão String p/ Double formatado
    
    func convertToDouble(_ string: String) -> Double {
        
        formatter.numberStyle = .none
        
        return formatter.number(from: string)!.doubleValue
    }
    
    // Método para devolver um valor já formatado
    func getFormattedValue(of value: Double, withCurrenncy currency: String) -> String {
        
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        
        return formatter.string(for: value)!
    }


    private init() {
        formatter.usesGroupingSeparator = true
    }
}
