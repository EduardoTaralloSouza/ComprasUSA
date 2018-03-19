//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Eduardo Tarallo on 12/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }
    
    // Método
    func setAmmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrenncy: "R$ ")
        
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrenncy: "")
        
        lbRealDescription.text = "Valor sem Impostos (dólar \(dolar))"
    }
}

