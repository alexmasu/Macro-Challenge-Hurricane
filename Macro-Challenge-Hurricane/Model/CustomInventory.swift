//
//  CustomInventory.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 01/06/22.
//

import Foundation

class CustomInventory : NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(i, forKey: "inventory")
    }
    let unlocked =  1
    
    let equipped = 2
    
    var i: [Int]
    func save(){
        let savingCustomInventory = CustomInventoryJson(i: self.i)
        DataManager.standard.setCustomInventory(customInventory: savingCustomInventory)
            print("Customization inventory saved")
    }
    override init(){
        let readingCustomInventory = DataManager.standard.getCustomInventory()
        if readingCustomInventory != nil{
            i = readingCustomInventory!.i
        }
        else {
            i = []
        }
        
        
    }
    
    func equip(selected : Int) {
        if i[selected] == 1{
            let currentType = customizableV[selected].type
            for a in i {
                if customizableV[a].type == currentType && a != selected{
                    if i[a] == 2{
                        i[a] = 1
                    }
                }
            }
            i[selected] = 2
        }
    }
    
    func unlock(selected : Int) {
        if i[selected] != 1 && i[selected] != 2 && selected <= customizableV.count{
            i[selected] = 1
        }
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let i = decoder.decodeObject(of: NSArray.self, forKey: "i") as! [Int]
        self.init(I: i)
    }
    
    
    
    init (I : [Int]){
        i = I
    }
    func buy(currencies: Currencies, selected : Int) -> Int{
        if i[selected] != 2 && i[selected] != 1{
            let customizable = customizableV[selected]
            
            if customizable.requirement < currencies.followers{
                return -1
            }
            if customizable.priceBite == 0{
                if (currencies.money < customizable.price){
                    return -2
                }
                else {
                    currencies.money = currencies.money - customizable.price
                    i[selected] = 1
                    return 0
                }
            }
            else{
                if (currencies.bite < customizable.priceBite){
                    return -2
                }
                else {
                    currencies.bite = currencies.bite - customizable.priceBite
                    i[selected] = 1
                    return 0
                }
            }
            
        }
        return -3
    }
}
