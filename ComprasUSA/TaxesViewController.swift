//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Eduardo Tarallo on 12/03/2018.
//  Copyright © 2018 Eduardo Tarallo. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxdescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }
    
    func calculateTaxes() {
        
        lbStateTaxdescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrenncy: ""))%)"
        lbIOFDescription.text      = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrenncy: ""))%)"
        
        lbDolar.text    = tc.getFormattedValue(of: tc.shoppingValue, withCurrenncy: "US$ ")
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrenncy: "US$ ")
        lbIOF.text      = tc.getFormattedValue(of: tc.iofValue,      withCurrenncy: "US$ ")
        
        let real    = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrenncy: "R$ ")
    }


    // MARK: - Actions
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }

}













