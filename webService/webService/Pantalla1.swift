//
//  ViewController.swift
//  webService
//
//  Created by Alejandro Santoyo on 17/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class Pantalla1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func pantalla2(sender: UIButton) {
        //Hace referencia al storyboard donde estan las vistas, en este casoo al main.storyboard
        let nuestroStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //asgina a la variable el instancia de la pantalla a la cual se quiere navegar
        let nuestraPantalla2 = nuestroStoryBoard.instantiateViewControllerWithIdentifier("p2") as! Pantalla2
        
        //presenta la pantalla deseada
        //self.presentViewController(nuestraPantalla2, animated: true, completion: nil)
        
        //presenta la pantalla deseada por medio de pilas Stack
        self.navigationController!.pushViewController(nuestraPantalla2, animated: true)
    }
    

}

