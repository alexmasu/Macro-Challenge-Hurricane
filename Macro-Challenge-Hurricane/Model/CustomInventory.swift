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
    var new: Bool
    func save(){
        let savingCustomInventory = CustomInventoryJson(i: self.i,new: self.new)
        DataManager.standard.setCustomInventory(customInventory: savingCustomInventory)
            print("Customization inventory saved")
    }
    override init(){
        let readingCustomInventory = DataManager.standard.getCustomInventory()
        if (readingCustomInventory?.new) != nil{
            i = readingCustomInventory!.i
            new = false
        }
        else {
            i = []
            new = false
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
            self.save()
        }
    }
    
    func unlock(selected : Int) {
        if i[selected] != 1 && i[selected] != 2 && selected <= customizableV.count{
            i[selected] = 1
            self.save()
        }
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let i = decoder.decodeObject(of: NSArray.self, forKey: "i") as! [Int]
        self.init(I: i)
    }
    
    
    
    init (I : [Int]){
        i = I
        new = false
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
                    self.save()
                    currencies.save()
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
                    self.save()
                    currencies.save()
                    return 0
                }
            }
            
        }
        return -3
    }
    func selectForDisplay() -> [customizable]{
        var elem = 0
        var tempV: [Int] = []
        while i[elem] < i.count{
            if i[elem] > 0{
                tempV.append(elem)
            }
            elem = elem + 1
        }
//        let customizableV = [ventilatoreZephir,standardMonitor,standardTappeto,standardSedia,standardLampadaStreaming,lampadaDaLetto,LettoStandard,accessoriStandard,vascaStandard,tendaStandard,saponiStandard]
        var toShow: [customizable] = []
        for el in tempV{
            switch el {
            case 0:
                toShow.append(ventilatoreZephir)
            case 1:
                toShow.append(standardMonitor)
            case 2:
                toShow.append(standardTappeto)
            case 3:
                toShow.append(standardSedia)
            case 4:
                toShow.append(standardLampadaStreaming)
            case 5:
                toShow.append(lampadaDaLetto)
            case 6:
                toShow.append(LettoStandard)
            case 7:
                toShow.append(accessoriStandard)
            case 8:
                toShow.append(vascaStandard)
            case 9:
                toShow.append(tendaStandard)
            case 10:
                toShow.append(saponiStandard)
            default :
                print("koi doesn't exist")
            }
        }
        return toShow
    }
    func displayEquipped() -> [Bool]{
        
            var elem = 0
            var tempV: [Bool] = []
            while i[elem] < i.count{
                if i[elem] > 0{
                    if i[elem] == 2{
                        tempV.append(true)
                    }else {
                        tempV.append(false)
                    }
                }
                elem = elem + 1
            }
            
            return tempV
        }
}
