//
//  ViewController.swift
//  Email
//
//  Created by Alejandro Santoyo on 22/01/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate  {

    var asunto:String?
    var destinario:String?
    var mailController: MFMailComposeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*asunto = "Correo de prueba"
        destinario = "satchsantoy@hotmail.com"*/
    }

    @IBOutlet weak var dest: UITextField!
    @IBOutlet weak var asun: UITextField!
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dest{
            asun.becomeFirstResponder()
        }else{
            asun.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func enviarCorreo(sender: UIButton) {
        
        destinario = dest.text
        asunto = asun.text
        
        if(MFMailComposeViewController.canSendMail()){ //comprueba que el usuario pueda mandar emails
            //crear el objeto
            mailController = MFMailComposeViewController()
            //asignar delegado al controlador de email
            mailController!.mailComposeDelegate = self
            //completar objeto mailController
            mailController!.setSubject(asunto!)
            
            let arregloDestinatarios = [destinario!]
            
            mailController?.setToRecipients(arregloDestinatarios)
            self.presentViewController(mailController!, animated: true, completion: nil)
            
        } else{
            //crear una alerta
            let alerta = UIAlertController(title: "Soy una alerta >u<", message: "No puedo enviar emails 😏", preferredStyle: .Alert)
            //crear botones de alerta
            let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel){
                (action:UIAlertAction!) in print("Pulsaste botón cancelar")
            }
            
            let aceptar = UIAlertAction(title: "Ok", style: .Default){
                (action:UIAlertAction!) in print("Pulsaste botón Ok")
            }
            //agregar botones a la alertra
            alerta.addAction(cancelar)
            alerta.addAction(aceptar)
            //mostrar la alerta
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    
    func  mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            
            print("Se cancelo envio")
            
        case MFMailComposeResultSaved.rawValue:
            
            print("Se guardo borrador")
            
        case MFMailComposeResultFailed.rawValue:
            
            print("Fallo el envio")
            
        case MFMailComposeResultSent.rawValue:
            
            print("El mail se pudo enviar y esta en la pila de envio")
            
        default:
            break
            
            
        }
        
        
        mailController!.dismissViewControllerAnimated(true,
            
            //Clousure a ejecutar al finalizar de mostrar la vista
            
            completion: { () -> Void in
                
                
                //EJEMPLO ACTUALIZAR BASE DE DATOS
                
        })
    }

}

