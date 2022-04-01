//
//  Arme.swift
//  Swift_RPG
//
//  Created by Thibault Buze on 15/01/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import Foundation

class Arme{
    var degat: Int
    
    init(degat:Int){
        self.degat = degat
    }
    
    func AmeliorerArme(degat: Int){
        self.degat+=degat
    }
}

class Archer: Arme{
    var amelioration = 10
    init(){
       super.init(degat: 100)
    }
    
    func AmeliorerArme() {
        super.AmeliorerArme(degat: amelioration)
    }
}

class Hache: Arme{
    var amelioration = 20
    init(){
        super.init(degat: 80)
    }
    
    func AmeliorerArme() {
        super.AmeliorerArme(degat: amelioration)
    }
}

class Spectre: Arme{
    var amelioration = 5
    
    init(){
        super.init(degat: 120)
    }
    
    func AmeliorerArme() {
        super.AmeliorerArme(degat: amelioration)
    }
}
