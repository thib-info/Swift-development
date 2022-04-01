//
//  main.swift
//  Swift_RPG
//
//  Created by Thibault Buze on 15/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import Foundation

func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}

var choix: Int

repeat{
print("Classe du personnage 1 :")
print("1 : Archer")
print("2 : Mage")
print("3 : Guerrier")
print("Votre choix : ")
choix = input()
} while(choix<1 && choix>3)

print("Donner lui un nom : ")
var name = readLine()
var perso1: Personnage!
var tperso1: TypePersonnage!

switch choix{
case 1:
    tperso1 = .Archer
    perso1 = Personnage(nom: name!, type_perso: tperso1)
case 2:
    tperso1 = .Mage
    perso1 = Personnage(nom: name!, type_perso: tperso1)
case 3:
    tperso1 = .Guerrier
    perso1 = Personnage(nom: name!, type_perso: tperso1)
default:
    break
}

repeat{
    print("Classe du personnage 2 :")
    print("1 : Archer")
    print("2 : Mage")
    print("3 : Guerrier")
    print("Votre choix : ")
    choix = input()
} while(choix<1 && choix>3)

print("Donner lui un nom : ")
var name2 = readLine()
var perso2: Personnage!
var tperso2: TypePersonnage!

switch choix{
case 1:
    tperso2 = .Archer
    perso2 = Personnage(nom: name2!, type_perso: tperso2)
case 2:
    tperso2 = .Mage
    perso2 = Personnage(nom: name2!, type_perso: tperso2)
case 3:
    tperso2 = .Guerrier
    perso2 = Personnage(nom: name2!, type_perso: tperso2)
default:
    break
}

while(perso1.vie > 0 && perso2.vie > 0){
    
}
