//
//  TableViewController.swift
//  Table view
//
//  Created by Alejandro Santoyo on 15/11/15.
//  Copyright © 2015 Alejandro Santoyo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let diasSemana: [String] = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"]
    let meses: [String] = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if diasSemana.count > meses.count{
            return diasSemana.count
        }else{
            return meses.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        if indexPath.section == 0{
        cell.textLabel?.text = diasSemana[indexPath.row]
        } else{
        cell.textLabel?.text = meses[indexPath.row]
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let renglon = indexPath.row
        let seccion = indexPath.section
        
        print("El renglon: \(renglon)")
        print("El seccion: \(seccion)")
    }
    
}
