//
//  main.swift
//  Swift_discover
//
//  Created by Thibault Buze on 09/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import Foundation

func input() -> Int{
    let data = readLine()
    return Int(data )
}


func multiplication(_ a: Int,_ b: Int) -> Int{
    return a*b
}

func addition(a: Int, b: Int) -> Int{
    return a*b
}

func division(a: Int,b: Int) -> Double{
    return Double(a/b)
}
    
print("Bienvenue dans le TP calculette")
print("1 - Addition")
print("2 - Soustraction")
print("3 - Division")
print("4 - Multiplication")

print("Votre choix : ")
var user = input()
print("Premier nombre : ")
var a:Int = input()
print("Deuxieme nombre : ")
var b:Int = input()

switch user {
case 1:
    print(addition(a: a, b: b))
case 3:
    print(division(a: a, b: b))
case 4:
    print(multiplication(a, b))
default:
    print("ERROR 404")
}
