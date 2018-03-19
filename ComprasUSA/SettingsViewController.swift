//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Eduardo Tarallo on 12/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStateTaxes: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfDolar.text      = tc.getFormattedValue(of: tc.dolar,    withCurrenncy: "")
        tfIOF.text        = tc.getFormattedValue(of: tc.iof,      withCurrenncy: "")
        tfStateTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrenncy: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Método para repassar estes valores para a Próxima tela (TaxesCalculator)
    func setValues() {
        tc.dolar    = tc.convertToDouble(tfDolar.text!)
        tc.iof      = tc.convertToDouble(tfIOF.text!)
        tc.stateTax = tc.convertToDouble(tfStateTaxes.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}






