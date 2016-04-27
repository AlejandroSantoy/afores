//
//  Calculadora.swift
//  c4c
//
//  Created by Alejandro Santoyo on 23/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class Calculadora: UIViewController {

    
    @IBOutlet weak var txtMonto: UITextField!
    @IBOutlet weak var txtAños: UITextField!
    
    //Textfield no editables por el usuario
    @IBOutlet weak var txtNumPagos: UITextField!
    @IBOutlet weak var txtPagoMensual: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnCalcular(sender: AnyObject) {
        if isEmpty() {
            let alerta = UIAlertController(title: "Error.",
                                           message: "Todos los campos son requeridos.", preferredStyle: .Alert)
            
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default){
                (action:UIAlertAction!) in
            }

            alerta.addAction(aceptar)
            self.presentViewController(alerta, animated: true, completion: nil)
        } else{
            txtNumPagos.text = String(cantPagos())
            txtPagoMensual.text = String(pago())
        }
    }
    
    func isEmpty() -> BooleanType{
        if txtMonto!.text != "" && txtAños!.text != "" {
            return false
        } else{
            return true
        }
    }
    
    func cantPagos() -> Int{
        let nPagos : Int = Int(txtAños.text!)! * 12
        return nPagos
    }
    
    func pago() -> Double{
        var interesMensual : Double = (9/100) / 12
        print(interesMensual)
        let temp : Double = Double(txtMonto.text!)! * interesMensual
        print(temp)
        interesMensual += 1
        interesMensual = pow(interesMensual,Double(cantPagos()) * -1)
        interesMensual -= 1
        print(interesMensual)
        return round(temp/interesMensual) * -1
    }
}
