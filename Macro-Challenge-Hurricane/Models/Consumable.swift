//
//  item.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 31/05/22.
//

import Foundation

class Consumable: NSObject{
    
    
    var id : Int
    var name: String
    var price: Int
    var requirement: Int
    var info: String
    
        
    init(Id: Int, Name: String, Price: Int, Requirement: Int, Info: String){
        id = Id
        name = Name
        price = Price
        requirement = Requirement
        info = Info
    }
    
}

let hamburger = Consumable(Id: 0, Name: "Hamburger", Price: 6, Requirement: 0, Info: "it looks tasty, now i wanna paint my face and wear red shoes")
