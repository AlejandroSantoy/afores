//
//  ViewController.swift
//  c4c
//
//  Created by Alejandro Santoyo on 22/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var textUsuario: UITextField!
    @IBOutlet weak var textContraseña: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnIngresar(sender: UIButton) {
        if textUsuario.text == "admin" && textContraseña.text == "admin" {
            //Hace referencia al storyboard donde estan las vistas, en este casoo al main.storyboard
            let strBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            //asgina a la variable el instancia de la pantalla a la cual se quiere navegar
            let pantallaPrinc = strBoard.instantiateViewControllerWithIdentifier("principal") as! VentanaPrincipal
            
            //presenta la pantalla deseada
            self.presentViewController(pantallaPrinc, animated: true, completion: nil)
            
            //crear una alerta
            let alerta = UIAlertController(title: "Acceso correcyo.",
                                           message: "Bienvenido Administrador.", preferredStyle: .Alert)
            //crear botones de alerta
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default){
                (action:UIAlertAction!) in
            }
            //agregar botones a la alertra
            alerta.addAction(aceptar)
            //mostrar la alerta
            self.presentViewController(alerta, animated: true, completion: nil)
        } else{
            let alerta = UIAlertController(title: "Acceso fallido.",
                                           message: "Usuario o contraseña invalido.", preferredStyle: .Alert)
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default){
                (action:UIAlertAction!) in
            }

            alerta.addAction(aceptar)
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }

}

