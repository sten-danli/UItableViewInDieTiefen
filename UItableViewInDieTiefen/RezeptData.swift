//
//  RezeptData.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 04.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import Foundation

class RezeptData{
    let kategorien=["Frühstück","Mittag"]
    var rezepte:[[RezeptModle]]
    
    init() {
        self.rezepte=[[RezeptModle]]()
        
        rezepte.append([RezeptModle]())
        
        rezepte[0].append(RezeptModle(title: "Diamand", bild: "Diamand", zutaten: ["Salze","Eier","Nuss"]))
        rezepte[0].append(RezeptModle(title: "Die Diamantspitzhacke", bild: "Diamand", zutaten: ["Salze","Eier","Nuss"]))
        
        
        rezepte.append([RezeptModle]())
        rezepte[1].append(RezeptModle(title: "Enderman", bild: "Diamand", zutaten: ["Salze","Eier","Nuss"]))
        rezepte[1].append(RezeptModle(title: "ErdBlock", bild: "Diamand", zutaten: ["Salze","Eier","Nuss"]))
    }
    
    func getSection(section:Int)->String{
        return kategorien[section]
    }
    
    
}
