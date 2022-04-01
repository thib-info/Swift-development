//
//  Personnage.swift
//  Swift_RPG
//
//  Created by Thibault Buze on 15/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import Foundation

enum TypePersonnage{
    case Archer
    case Mage
    case Guerrier
}

class Personnage{
    var nom:String
    var type_perso: TypePersonnage
    var vie = 100
    var arme: Arme
    
    init(nom: String, type_perso: TypePersonnage){
        self.nom = nom
        self.type_perso = type_perso
        
        switch self.type_perso{
        case .Archer:
            print("je suis un archer")
            self.arme = Archer()
        case .Mage:
            print("Je suis un mage")
            self.arme = Spectre()
        case .Guerrier:
            print("Je suis un guerrier")
            self.arme = Hache()
        }
    }
    
    func input() -> Int {
        let strData = readLine();
        
        return Int(strData!)!
    }

    
    func description(perso : Personnage){
        print("\(perso.nom) a encore \(perso.vie) points de vie et son arme a \(perso.arme.degat) degats")
    }
    
    func jouer(Personnage: Personnage){
        var choix:Int
        
        description(perso: Personnage)
        
        repeat{
            print("1. Attaquer")
            print("2. Ameliorer arme")
            print("Votre choix : ")
            choix = input()
        }while(choix != 1 && choix != 2)
        
        switch choix{
        case 1: Personnage.vie = Attaquer(vie: Personnage.vie)
        case 2: AmeliorerArme()
        default: break
        }
    }
    
    func Attaquer(vie: Int) -> Int{
        var newlife: Int = vie
        newlife -= self.arme.degat
        return newlife
    }
    
    func AmeliorerArme(){
        switch self.type_perso{
        case .Archer:
            arme.AmeliorerArme(degat: 10)
        case .Mage:
            arme.AmeliorerArme(degat: 5)
        case .Guerrier:
            arme.AmeliorerArme(degat: 20)
        }
    }
    
    
}
