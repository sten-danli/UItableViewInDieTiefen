//
//  RezeptData.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 04.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import Foundation

class RezeptData{
    let kategorien=["Frühstück","Mittag","Abend Essen"]
    var rezepte:[[RezeptModle]]
    
    init() {
        self.rezepte=[[RezeptModle]]()
        
        rezepte.append([RezeptModle]())
        
        rezepte[0].append(RezeptModle(title: "Diamand", bild: "Diamand", zutaten: ["Salze","Eier","Nuss"]))
        rezepte[0].append(RezeptModle(title: "Die Diamantspitzhacke", bild: "Die Diamantspitzhacke", zutaten: ["Endermann","Zombie","Spider"]))
        
        
        rezepte.append([RezeptModle]())
        rezepte[1].append(RezeptModle(title: "ErdBlock", bild: "ErdBlock", zutaten: ["Diamand","Ida","Eima"]))
        rezepte[1].append(RezeptModle(title: "Werkbank", bild: "Werkbank", zutaten: ["Haian Kata","Nidan","Sandan"]))
        
        rezepte.append([RezeptModle]())
        rezepte[2].append(RezeptModle(title: "Das Skelett", bild: "Das Skelett", zutaten: ["Diamand","Ida","Eima"]))
        rezepte[2].append(RezeptModle(title: "Der Wolf", bild: "Der Wolf", zutaten: ["Haian Kata","Nidan","Sandan"]))
    }
    
    func getSection(section:Int)->String{
        return kategorien[section]
    }
    
    
}
