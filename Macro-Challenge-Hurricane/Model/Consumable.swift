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
    var consumable_image: String
    
    
    init(Id: Int, Name: String, Price: Int, Requirement: Int, Info: String, Consumable_image: String){
        id = Id
        name = Name
        price = Price
        requirement = Requirement
        info = Info
        consumable_image = Consumable_image
    }
    
}

let hamburger = Consumable(Id: 0, Name: "hamburger".localized(), Price: 8, Requirement: 0, Info: "hamburger description".localized(), Consumable_image: "paninemerd.png")

let pizza = Consumable(Id: 1, Name: "pizza".localized(), Price: 12, Requirement: 50, Info: "pizza description".localized(), Consumable_image: "pizzott.png")

let patatine = Consumable(Id: 2, Name: "potato chip".localized(), Price: 4, Requirement: 0, Info: "patatine description".localized(), Consumable_image: "patane.png")

let acqua = Consumable(Id: 3, Name: "water".localized(), Price: 5, Requirement: 0, Info: "acqua description".localized(), Consumable_image: "Acquarella.png")

//let soda = Consumable(Id: 4, Name: "soda".localized(),Price: 9,Requirement: 0,Info: "soda description".localized(), Consumable_image: "")
//
//let sevenMochi = Consumable(Id: 5, Name: "7Mochi".localized(), Price: 13, Requirement: 50, Info: "7Mochi description".localized(), Consumable_image: "")
//
//let gelato = Consumable(Id: 6, Name: "icecream".localized(), Price: 12, Requirement: 100, Info: "icecream description".localized(), Consumable_image: "")
//
//let cornetto = Consumable (Id: 7, Name: "croissant".localized(), Price: 18, Requirement: 100, Info: "croissant description".localized(), Consumable_image: "")
//
let siringa = Consumable(Id: 4, Name: "syringe".localized(), Price: 9, Requirement: 0, Info: "syringe description".localized(), Consumable_image: "Siringella.png")

//let consumableV = [hamburger,pizza,patatine,acqua,soda,sevenMochi,gelato,cornetto,siringa]

let consumableV = [hamburger,pizza,patatine,acqua,siringa]
