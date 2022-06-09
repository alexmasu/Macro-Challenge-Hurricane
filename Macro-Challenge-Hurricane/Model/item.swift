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

let hamburger = Consumable(Id: 0, Name: "hamburger", Price: 8, Requirement: 0, Info: "it looks tasty, I feel like i'm the clowns' king")
let pizza = Consumable(Id: 1, Name: "pizza", Price: 12, Requirement: 50, Info: "Simple, traditional without pineapple. Erne ta po magnà a pizza...")
let patatine = Consumable(Id: 2, Name: "patatine", Price: 4, Requirement: 0, Info: "Prendo una patatina e me la mangio. Nessuno potrà notare cosa sta nel pacchetto...")
let acqua = Consumable(Id: 3, Name: "acqua", Price: 5, Requirement: 0, Info: "fortunatamente questa non viene da una vasca da bagno")
let soda = Consumable(Id: 4, Name: "soda",Price: 9,Requirement: 0,Info: "")
let sevenMochi = Consumable(Id: 5, Name: "7Mochi", Price: 13, Requirement: 50, Info: "")
let gelato = Consumable(Id: 6, Name: "Gelato", Price: 12, Requirement: 100, Info: " al cioccolato, dolce, un po' salato")
let cornetto = Consumable (Id: 7, Name: "cornetto", Price: 18, Requirement: 100, Info: "pijatelo, pijatelo!")
let siringa = Consumable(Id: 8, Name: "siringa", Price: 9, Requirement: 0, Info: "Cura le malattie. non fa male, non fa male...")

let consumableV = [hamburger,pizza,patatine,acqua,soda,sevenMochi,gelato,cornetto,siringa]
