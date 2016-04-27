//
//  ViewController.swift
//  gif
//
//  Created by Alejandro Santoyo on 26/04/16.
//  Copyright © 2016 Alejandro Santoyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("abr-24-2016 10-53-51", withExtension: "gif")!)
        let imageGif = UIImage.gifWithData(<#T##data: NSData##NSData#>)()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

