//
//  PC.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 31/05/22.
//

import Foundation

class customizable {
    
    var id: Int
    var type: String
    
    var name: String
    var descr: String
    
    var priceBite: Int
    var price: Int
    
    var requirement: Int

    
    
    init (Id: Int, Type: String, Name :String,Descr : String, PriceBite: Int, Price: Int, Requirement : Int ){
        
        id = Id
        type = Type
        name = Name
        descr = Descr
        priceBite = PriceBite
        price = Price
        requirement = Requirement
    }
    
}
let ventilatoreZephir = customizable(Id : 0, Type: "ventilatore", Name: "VentilatoreZephir", Descr: "It doesn't seem to work well", PriceBite: 0, Price : 100, Requirement: 0)
let customizableV = [ventilatoreZephir]


