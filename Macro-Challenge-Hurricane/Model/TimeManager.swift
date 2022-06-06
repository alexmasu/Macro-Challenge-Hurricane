//
//  TimeManager.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 20/05/22.
//

import Foundation

extension Date{
    static func - (lhs: Date, rhs: Date)-> TimeInterval{
        return lhs.timeIntervalSinceReferenceDate-rhs.timeIntervalSinceReferenceDate
    }
}

class TimeManager {
    
    var lastSave: Date?
    
    
    func save(){
        let savingTimeManager = TimeManagerJson(lastSave: self.lastSave ?? Date.now, savedDates: self.savedDates)
        DataManager.standard.setTimeManager(timeManager: savingTimeManager)
            print("timeManager saved")
    }
    init(){
        let readingTimeManager = DataManager.standard.getTimeManager()
        if readingTimeManager != nil{
            lastSave = readingTimeManager!.lastSave
            savedDates = readingTimeManager!.savedDates
        }
        else {
            lastSave = Date.now
            savedDates = []
        }
        
        
    }
    func encode(with coder: NSCoder) {
        coder.encode(lastSave, forKey: "lastSave")
        coder.encode(savedDates, forKey: "savedDates")
        
    }
    
    internal required convenience init?(coder decoder: NSCoder) {
        let lastSave = decoder.decodeObject(of: NSDate.self, forKey: "lastSave") as Date?
        let savedDates = decoder.decodeObject(of: NSArray.self, forKey: "SavedDates") as! [Date]
        
        self.init()
        self.lastSave = lastSave
        
        if lastSave != nil {
            self.lastSave = lastSave
        }
        if savedDates != []{
            self.savedDates = savedDates
        }
    }
    
    static let state = TimeManager()
    var savedDates : [Date?]
    
    var date : Date {Date.now}
    func timeElapsedsince(date1: Date) -> Int{
        return Int((lastSave ?? date) - date)
    }
    func saveDate (){
        lastSave = date
    }
    func dateAppend (){
        savedDates.append(date)
    }
    
    func freeSavedDates(){
        savedDates.removeAll()
    }
    
    func AfterOffline(mochi : Mochi,currencies : Currencies) {
        
        var poopInterval : Int
        
        switch mochi.ageType{
        case 0:
            poopInterval = 10800
        case 1:
            poopInterval = 21600
        case 2:
            poopInterval = 28800
        default:
            poopInterval = 10800
        }
        
        mochi.nPoop = mochi.nPoop + 1 * (timeElapsedsince(date1: lastSave!))/poopInterval
        mochi.pPoop = mochi.pPoop + (100 * (timeElapsedsince(date1: lastSave!)%poopInterval)) / poopInterval
        if (mochi.pPoop > 99) {
            mochi.pPoop = mochi.pPoop - 100
            mochi.nPoop = mochi.nPoop + 1
        }
        var cleanIntervall : Int
        
        switch mochi.nPoop {
        case 0:
            cleanIntervall = 1200
        case 1:
            cleanIntervall = 840
        case 2:
            cleanIntervall = 480
        default:
            cleanIntervall = 120
        }
        
        mochi.cleanlyness = max(0, mochi.cleanlyness - 1 * (timeElapsedsince(date1: lastSave!))/cleanIntervall)
        mochi.pCleanlyness = mochi.pCleanlyness + (100 * (timeElapsedsince(date1: lastSave!)%cleanIntervall) ) / cleanIntervall
        if (mochi.pCleanlyness > 99) {
            mochi.pCleanlyness = mochi.pCleanlyness - 100
            mochi.cleanlyness = max(0, mochi.cleanlyness - 1)
        }
        
        var illChance : Int = 0
        if (mochi.cleanlyness > 79){
            illChance = 0
        }
        if (mochi.cleanlyness < 80){
            illChance = (100 - mochi.cleanlyness)/5
        }
        if mochi.cleanlyness <  50{
            illChance = (100 - mochi.cleanlyness)/4
        }
        if mochi.cleanlyness < 25{
            illChance = (100 - mochi.cleanlyness)/3
        }
        var illChecks : Int
        
        illChecks = (timeElapsedsince(date1: lastSave!))/1800
        
        mochi.pIll = mochi.pIll + 100 * (timeElapsedsince(date1: lastSave!)%1800) / 1800
        if (mochi.pIll > 99) {
            mochi.pIll = mochi.pHunger - 100
            illChecks = illChecks + 1
        }
        var i = 0
        while (mochi.ill == false && i < illChecks){
            var roll : Int
            roll = Int.random(in: 1...100)
            if roll < illChance {
                mochi.ill = true
            }
            i = i + 1
        }
        
        if mochi.sleeping == false{
            //            inserire euphoria check
            mochi.hunger = max(0, mochi.hunger - 1 * (timeElapsedsince(date1: lastSave!))/420)
            mochi.pHunger = mochi.pHunger + (100 * (timeElapsedsince(date1: lastSave!)%420)) / 420
            if (mochi.pHunger > 99) {
                mochi.pHunger = mochi.pHunger - 100
                mochi.hunger = max(0, mochi.hunger - 1)
            }
            mochi.thirst = max(0, mochi.thirst - 1 * (timeElapsedsince(date1: lastSave!))/350)
            mochi.pThirst = mochi.pThirst + (100 * (timeElapsedsince(date1: lastSave!)%350)) / 350
            if (mochi.pThirst > 99) {
                mochi.pThirst = mochi.pThirst - 100
                mochi.pThirst = max(0, mochi.thirst - 1)
            }
            if (mochi.streaming == true){
                //                inserire chiamata a funzione per i guadagni
                mochi.energy = max (0, mochi.energy - 1 * (timeElapsedsince(date1: lastSave!))/432)
                mochi.pEnergy = mochi.pEnergy + (100 * (timeElapsedsince(date1: lastSave!)%432)) / 432
                if (mochi.pEnergy > 99) {
                    mochi.pEnergy = mochi.pEnergy - 100
                    mochi.energy = max(0, mochi.energy - 1)
                }
                else{
                    mochi.energy = max (0, mochi.energy - 1 * (timeElapsedsince(date1: lastSave!))/864)
                    mochi.pEnergy = mochi.pEnergy + (100 * (timeElapsedsince(date1: lastSave!)%864)) / 864
                    if (mochi.pEnergy > 99) {
                        mochi.pEnergy = mochi.pEnergy - 100
                        mochi.energy = max(0, mochi.energy - 1)
                    }
                }
            }
        }
        else {
            mochi.hunger = max(0, mochi.hunger - 1 * (timeElapsedsince(date1: lastSave!))/840 )
            mochi.pHunger = mochi.pHunger + (100 * (timeElapsedsince(date1: lastSave!)%840)) / 840
            if (mochi.pHunger > 99) {
                mochi.pHunger = mochi.pHunger - 100
                mochi.hunger = max(0, mochi.hunger - 1)
            }
            mochi.thirst = max(0, mochi.thirst - 1 * (timeElapsedsince(date1: lastSave!))/700)
            mochi.pThirst = mochi.pThirst + (100 * (timeElapsedsince(date1: lastSave!)%700)) / 700
            if (mochi.pThirst > 99) {
                mochi.pThirst = mochi.pThirst - 100
                mochi.pThirst = max(0, mochi.thirst - 1)
            }
            let tempEnergy = mochi.energy
            mochi.energy = max (0, mochi.energy + 1 * (timeElapsedsince(date1: lastSave!))/180)
            mochi.pEnergyGain = mochi.pEnergyGain + 100 * (timeElapsedsince(date1: lastSave!)%180) / 180
            if (mochi.pEnergyGain > 99) {
                mochi.pEnergyGain = mochi.pEnergyGain - 100
                mochi.energy = max(0, mochi.energy + 1)
            }
            if timeElapsedsince(date1: lastSave!)/180 > mochi.maxEnergy - tempEnergy {
                let extraTime = timeElapsedsince(date1: lastSave!) - (mochi.maxEnergy - tempEnergy) * 180
                let actPWake = mochi.pWake
                mochi.pWake = mochi.pWake + (100 * extraTime % 10800) / 10800
                if mochi.pWake > 100 {
                    mochi.pWake = 100
                }
                let extraPWake = mochi.pWake - actPWake
                if (mochi.pWake > 99) {
                    mochi.pWake = 0
                    mochi.sleeping = false
                    let TimeAfterWakeUp = extraTime - (10800 * extraPWake) / 100
                    
                    mochi.energy = max (0, mochi.energy - 1 * TimeAfterWakeUp/864)
                    mochi.pEnergy = mochi.pEnergy + (100 * (TimeAfterWakeUp%864)) / 864
                    if (mochi.pEnergy > 99) {
                        mochi.pEnergy = mochi.pEnergy - 100
                        mochi.energy = max(0, mochi.energy - 1)
                    }
                }
            }
        }
        
        if mochi.hunger == 0 {
            mochi.health = max (0, mochi.health - 1 * (timeElapsedsince(date1: lastSave!))/1200)
            mochi.pHealthHunger = mochi.pHealthHunger + (100 * (timeElapsedsince(date1: lastSave!)%1200)) / 1200
            if (mochi.pHealthHunger > 99) {
                mochi.pHealthHunger = mochi.pHealthHunger - 100
                mochi.health = max(0, mochi.health - 1)
            }
        }
        if mochi.thirst == 0 {
            mochi.health = max (0, mochi.health - 1 * (timeElapsedsince(date1: lastSave!))/1200)
            mochi.pHealthThirst = mochi.pHealthThirst + (100 * (timeElapsedsince(date1: lastSave!)%1200)) / 1200
            if (mochi.pHealthThirst > 99) {
                mochi.pHealthThirst = mochi.pHealthThirst - 100
                mochi.health = max(0, mochi.health - 1)
            }
        }
        if mochi.ill == true {
            mochi.health = max (0, mochi.health - 1 * (timeElapsedsince(date1: lastSave!))/900)
            mochi.pHealthIll = mochi.pHealthIll + (100 * (timeElapsedsince(date1: lastSave!)%900)) / 900
            if (mochi.pHealthIll > 99) {
                mochi.pHealthIll = mochi.pHealthIll - 100
                mochi.health = max(0, mochi.health - 1)
            }
        }
        mochi.happiness = max (0, mochi.happiness - 1 * (timeElapsedsince(date1: lastSave!))/1728)
        if (mochi.hunger < 30){
            mochi.happiness = max (0, mochi.happiness - 1 * (timeElapsedsince(date1: lastSave!))/1728)
        }
        if (mochi.thirst < 30){
            mochi.happiness = max (0, mochi.happiness - 1 * (timeElapsedsince(date1: lastSave!))/1728)
        }
        if (mochi.cleanlyness < 30){
            mochi.happiness = max (0, mochi.happiness - 1 * (timeElapsedsince(date1: lastSave!))/1728)
        }
        if (mochi.ill == true){
            mochi.happiness = max (0, mochi.happiness - 1 * (timeElapsedsince(date1: lastSave!))/1728)
        }
        mochi.pHappyness = mochi.pHappyness + (100 * (timeElapsedsince(date1: lastSave!)%1728)) / 1728
        if (mochi.pHappyness > 99) {
            mochi.pHappyness = mochi.pHappyness - 100
            mochi.happiness = max(0, mochi.happiness - 1)
            if mochi.hunger < 30 {
                mochi.happiness = max(0, mochi.happiness - 1)
            }
            if mochi.thirst < 30 {
                mochi.happiness = max(0, mochi.happiness - 1)
            }
            if mochi.cleanlyness < 30 {
                mochi.happiness = max(0, mochi.happiness - 1)
            }
            if mochi.ill == true {
                mochi.happiness = max(0, mochi.happiness - 1)
            }
        }
        lastSave = date
        //        salvare la felicità in un array per calcolare l'esito dello streaming
        //        verrà usata come punto di media; nell'array ci saranno inizio live, punti in cui l'app è stata aperta e come è finita la live.
    }
}
