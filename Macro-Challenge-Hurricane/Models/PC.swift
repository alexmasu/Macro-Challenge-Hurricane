//
//  PC.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 31/05/22.
//

import Foundation

class equip {
    
    var id: Int
    var type: String
    var unlocked: Bool
    var equipped: Bool
    var name: String
    var descr: String
    
    func toggleEquip() {
        equipped = !equipped
    }
    
    func Unlock() {
        unlocked = true
    }
    init (Id: Int, Type: String, Unlocked: Bool, Equipped: Bool, Name :String,Descr : String ){
        
        id = Id
        type = Type
        unlocked = Unlocked
        equipped = Equipped
        name = Name
        descr = Descr
    }
    
}
