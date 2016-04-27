//
//  ViewController.swift
//  autopartes
//
//  Created by Alejandro Santoyo on 12/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelUsuario: UITextField!
    @IBOutlet weak var labelContraseña: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnEntrar(sender: UIButton) {
        if(labelUsuario.text == "admin" && labelContraseña.text == "admin"){
            //crear una alerta
            let alerta = UIAlertController(title: "Acceso exitoso.",
                                           message: "Bienvenido Administrador.😏", preferredStyle: .Alert)
            //crear botones de alerta
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default){
                (action:UIAlertAction!) in print("Pulsaste botón Ok")
            }
            //agregar botones a la alertra
            alerta.addAction(aceptar)
            //mostrar la alerta
            self.presentViewController(alerta, animated: true, completion: nil)
        } else{
            //crear una alerta
            let alerta = UIAlertController(title: "Acceso fallido.",
                                           message: "Usuario o contraseña invalido.😐", preferredStyle: .Alert)
            //crear botones de alerta
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default){
                (action:UIAlertAction!) in print("Pulsaste botón Ok")
            }
            //agregar botones a la alertra
            alerta.addAction(aceptar)
            //mostrar la alerta
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }

}

