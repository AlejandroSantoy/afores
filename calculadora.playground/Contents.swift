//: Playground - noun: a place where people can play

import UIKit

let tasaAnual : Double = 0.07            //fijos en la aplicación
let tasaMensual : Double = 0.07/12       //Fijos


//datos ingresados en los text
var añosAhorrar : Double = 15
var montoAhorar: Double = 2500
var añosRecibir : Double = 20


var cantMeses : Double = añosAhorrar * 12

//Valor futuro o ahorro sin comisión
func valFut() -> Double{
    let valorFuturo : Double = montoAhorar * ((pow(1 + tasaMensual, cantMeses) - 1)/tasaMensual) //ahorro sin comisión
    String(format: "%.2f", valorFuturo) //mostrar el resultado a dos decimales
    return valorFuturo
}

//Comisón en % de  C4C:
func porcentajeComision() -> Double{ //comisión c4c
    if cantMeses <= 180 {
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
    let colchon : Double = cantMeses * montoAhorar
    return colchon
}


//Porcentaje de ganancia si ahorra con nostoros:
func porcentajeGanancias() -> Double{
    let porcentaje : Double = (valFut() - ahorroColchon()) / valFut()
    return porcentaje * 100
}


//Número de depósitos:
func numDepositos() -> Double{
    let nDep : Double = añosRecibir * 12
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