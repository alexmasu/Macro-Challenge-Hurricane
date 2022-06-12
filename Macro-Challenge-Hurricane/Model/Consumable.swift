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

let hamburger = Consumable(Id: 0, Name: "hamburger".localized(), Price: 8, Requirement: 0, Info: "it looks tasty, I feel like i'm the clowns' king".localized(), Consumable_image: "Hamburger.png")

let pizza = Consumable(Id: 1, Name: "pizza".localized(), Price: 12, Requirement: 50, Info: "Simple, traditional without pineapple. Erne ta po magnà a pizza...".localized(), Consumable_image: "")

let patatine = Consumable(Id: 2, Name: "potato chip".localized(), Price: 4, Requirement: 0, Info: "I'll take a potato chip and eat it. Nobody will notice what's in the package...".localized(), Consumable_image: "")

let acqua = Consumable(Id: 3, Name: "water".localized(), Price: 5, Requirement: 0, Info: "luckily this doesn't come from a bathtub".localized(), Consumable_image: "")

let soda = Consumable(Id: 4, Name: "soda".localized(),Price: 9,Requirement: 0,Info: "better not to shake it".localized(), Consumable_image: "")

let sevenMochi = Consumable(Id: 5, Name: "7Mochi".localized(), Price: 13, Requirement: 50, Info: "it is not green in color".localized(), Consumable_image: "")

let gelato = Consumable(Id: 6, Name: "icecream".localized(), Price: 12, Requirement: 100, Info: "chocolate, sweet, a little salty".localized(), Consumable_image: "")

let cornetto = Consumable (Id: 7, Name: "croissant".localized(), Price: 18, Requirement: 100, Info: "catch him,catch him!".localized(), Consumable_image: "")

let siringa = Consumable(Id: 8, Name: "syringe".localized(), Price: 9, Requirement: 0, Info: "Cures diseases. It doesn't hurt, it doesn't hurt...".localized(), Consumable_image: "")

let consumableV = [hamburger,pizza,patatine,acqua,soda,sevenMochi,gelato,cornetto,siringa]
