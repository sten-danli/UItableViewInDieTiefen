//
//  RezeptModel.swift
//  UItableViewInDieTiefen
//
//  Created by Dan Li on 04.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import Foundation

class RezeptModle {
    var title:String
    var bild:String
    var zutaten:[String]
    
    init(title:String,bild:String,zutaten:[String]){
        self.title=title
        self.bild=bild
        self.zutaten=zutaten
    }
    
}
