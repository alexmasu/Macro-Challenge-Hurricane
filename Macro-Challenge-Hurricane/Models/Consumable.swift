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
    
        
    init(Id: Int, Name: String, Price: Int, Requirement: Int){
        id = Id
        name = Name
        price = Price
        requirement = Requirement
        
        
    }
    
    
    
}
