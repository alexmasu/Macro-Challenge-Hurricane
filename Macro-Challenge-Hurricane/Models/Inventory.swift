//
//  Inventory.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 31/05/22.
//

import Foundation

class Inventory : NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(i, forKey: "inventory")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let i = decoder.decodeObject(of: NSArray.self, forKey: "i") as! [Int]
        self.init(I: i)
    }
    
    var i: [Int]
    
    init (I : [Int]){
        i = I
    }
    func buy(currencies: Currencies, consumable : Consumable) -> Int{
        if consumable.requirement < currencies.followers{
            return -1
        }
        if (currencies.money < consumable.price){
            return -2
        }
        else {
            currencies.money = currencies.money - consumable.price
            i[consumable.id] = i[consumable.id] + 1
            return 0
        }
    }
    func consume(mochi : Mochi,consumable: Consumable) -> Bool{
        if i[consumable.id] < 1 {
            return false
        }
        switch consumable.id{
        case 0:
            mochi.hunger = mochi.hunger + 50

        default: print("koi doesn't exist")
            return false
        }
        i[consumable.id] = i[consumable.id] - 1
        return true
    }
}
