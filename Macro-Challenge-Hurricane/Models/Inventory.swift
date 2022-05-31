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
//    func buy(currencies: Currencies) -> Bool{
//        if (currencies.money < price){
//            return false
//        }
//        else {
//            currencies.money = currencies.money - price
//            i[id] = i[id] + 1
//        }
//    }
//    func consume(mochi : Mochi) -> Bool{
//        if i[id] < 1 {
//            return false
//        }
//        switch id{
//        case 0:
//            mochi.hunger = mochi.hunger + 10
//            
//        default: print("koi doesn't exist")
//            return false
//        }
//        i[id] = i[id] - 1
//        return true
//    }
}
