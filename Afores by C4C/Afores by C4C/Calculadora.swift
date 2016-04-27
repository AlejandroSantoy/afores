//
//  Calculadora.swift
//  c4c
//
//  Created by Alejandro Santoyo on 23/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class Calculadora: UIViewController {

    @IBOutlet weak var txtAños: UITextField!
    @IBOutlet weak var txtMonto: UITextField!
    @IBOutlet weak var txtAñosRecibir: UITextField!
    
    
    
    //Textfield no editables por el usuario
    @IBOutlet weak var txtMensual: UITextField!
    @IBOutlet weak var txtExhibicion: UITextField!

    var calc : Calculo?
    
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
            calc = Calculo()
            calc!.inputs(txtAños.text!, Monto: txtMonto.text!,AñosRecibir: txtAñosRecibir.text!)
            let nuestroStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let nuestraPantalla2  = nuestroStoryBoard.instantiateViewControllerWithIdentifier("resultado") as! Resultado
            nuestraPantalla2.loadView()
            
            self.presentViewController(nuestraPantalla2, animated: true, completion: nil)
            
            //nuestraPantalla2.lblMensual.text = "$ " + formato(recibirMensual())
            //nuestraPantalla2.lblExhi!.text! = "$ " + formato(solaExhibicion())
            nuestraPantalla2.lblMensual.text = "$ " + formato(calc!.recibirMensual())
            nuestraPantalla2.lblExhi!.text! = "$ " + formato(calc!.solaExhibicion())
        }
    }
    
    func isEmpty() -> BooleanType{
        if txtMonto!.text != "" && txtAños!.text != "" && txtAñosRecibir!.text != "" {
            return false
        } else{
            return true
        }
    }
    

    func formato (x : Double) -> String{
        let monto : Int = Int(x)
        let fmt = NSNumberFormatter()
        let dec : Double = Double(String(format: "%.2f", x - Double(monto)))!
        let total : Double = Double(monto) + dec
        
        fmt.numberStyle = .DecimalStyle
        //fmt.stringFromNumber(Int(String(format: "%.2f", recibirMensual()))!)!  // with my locale, "2,358,000"
        fmt.locale = NSLocale(localeIdentifier: "fr_FR")
        print(total)
        return fmt.stringFromNumber(total)!
    }
    
    /*func decimal() -> String{
        let entero : Int = Int(recibirMensual())
        let dec : Double = recibirMensual() - Double(entero)
        let total : Double = Double(entero) + dec
        return String(total)
    }*/
    /*********************************************************************************************************
                                            Operaciones
    **********************************************************************************************************/
    
    
    let tasaAnual : Double = 0.07            //fijos en la aplicación
    let tasaMensual : Double = 0.07/12       //Fijos
    
    func cantMes() -> Double{
        let cantMeses = Double(txtAños!.text!)! * 12
        return cantMeses
    }
    
    //Valor futuro o ahorro sin comisión
    func valFut() -> Double{
        let valorFuturo : Double = Double(txtMonto!.text!)! * ((pow(1 + tasaMensual, cantMes()) - 1)/tasaMensual) //ahorro sin comisión
        //String(format: "%.2f", valorFuturo) //mostrar el resultado a dos decimales
        return valorFuturo
    }
    
    //Comisón en % de  C4C:
    func porcentajeComision() -> Double{ //comisión c4c
        if cantMes() <= 180 {
            return 0.05
        } else{
            return 0.1
        }
    }
    
    //Monto de comisión C4C
    func montoComiC4C() -> Double{
        let comisionC4C : Double = valFut() * porcentajeComision()
        return comisionC4C
    }
    
    
    //Ahorro final:
    func ahorroFinal() -> Double{
        let ahorro : Double = valFut() - montoComiC4C()
        return ahorro
    }
    
    
    //Si lo ahorrara bajo el colchón obtendría:
    func ahorroColchon() -> Double{
        let colchon : Double = cantMes() * Double(txtMonto!.text!)!
        return colchon
    }
    
    
    //Porcentaje de ganancia si ahorra con nostoros:
    func porcentajeGanancias() -> Double{
        let porcentaje : Double = (valFut() - ahorroColchon()) / valFut()
        return porcentaje * 100
    }
    
    
    //Número de depósitos:
    func numDepositos() -> Double{
        let nDep : Double = Double(txtAñosRecibir!.text!)! * 12
        return nDep
    }
    
    //Monto a recibir mensualmente antes de impuestos:
    func recibirSinImpuestos() -> Double{
        let monto : Double = ahorroFinal() / numDepositos()
        return monto
    }
    
    
    //Monto a recibir en una sola exhibición:
    func solaExhibicion() -> Double {
        let monto : Double = ahorroColchon()
        return monto
    }
    
    //Impuestos
    func impuestos() -> Double{
        let imp : Double = valFut() * 0.2
        return imp
    }
    
    
    //Ahorro después de impuestos
    func ahorroDespImpuestos () -> Double{
        let monto : Double = valFut() - impuestos()
        return monto
    }
    
    //Monto después de impuestos y comisión
    func despuesImpCom() -> Double{
        let monto : Double = ahorroDespImpuestos() - montoComiC4C()
        return monto
    }
    
    //Monto a recibir mensualmente
    func recibirMensual() -> Double{
        let monto : Double = despuesImpCom() / numDepositos()
        return monto
    }
}
