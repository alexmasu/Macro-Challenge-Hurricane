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
    func save(){
        let savingInventory = InventoryJson(i: self.i)
        DataManager.standard.setInventory(inventory: savingInventory)
        print("inventory saved")
    }
    override init(){
        let readingInventory = DataManager.standard.getInventory()
        if readingInventory != nil{
            i = readingInventory!.i
        }
        else {
            i = []
        }
        
        
    }
    required convenience init?(coder decoder: NSCoder) {
        let i = decoder.decodeObject(of: NSArray.self, forKey: "i") as! [Int]
        self.init(I: i)
    }
    
    var i: [Int]
    
    init (I : [Int]){
        i = I
    }
    func buy(currencies: Currencies, selected : Int) -> Int{
        if selected <= consumableV.count{
            let consumable = consumableV[selected]
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
        return -3
    }
    func consume(mochi : Mochi,selected: Int) -> Bool{
        if selected <= consumableV.count {
            let consumable = consumableV[selected]
            if i[consumable.id] < 1 {
                return false
            }
            switch consumable.id{
            case 0:
                mochi.hunger = min(mochi.hunger + 45,mochi.maxHunger)
            case 1:
                mochi.hunger = min(mochi.hunger + 70,mochi.maxHunger)
            case 2:
                mochi.hunger = min(mochi.hunger + 20,mochi.maxHunger)
            case 3:
                mochi.thirst = min(mochi.hunger + 30,mochi.maxHunger)
            case 4:
                mochi.thirst = min(mochi.thirst + 55, mochi.maxThirst)
            case 5:
                mochi.thirst = min(mochi.thirst + 80, mochi.maxThirst)
            case 6:
                mochi.hunger = min(mochi.hunger + 40,mochi.maxHunger)
                mochi.happiness = min ( mochi.happiness + 10, mochi.maxHappiness)
                mochi.thirst = max(mochi.thirst - 10, 0)
            case 7:
                mochi.hunger = min(mochi.hunger + 50,mochi.maxHunger)
                mochi.happiness = min (mochi.happiness + 20, mochi.maxHappiness)
            case 8:
                mochi.ill = false
                mochi.health = min(mochi.health + 35, mochi.maxHealth)
                mochi.happiness = max(mochi.happiness - 40, 0)


            default: print("koi doesn't exist")
                return false
            }
            i[consumable.id] = i[consumable.id] - 1
            return true
            
        }
        return false
    }
}
