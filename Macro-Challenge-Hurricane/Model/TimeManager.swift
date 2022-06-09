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
    var arrayHappyness : [Int]
    var savedDate : Date
    func save(){
        let savingTimeManager = TimeManagerJson(lastSave: self.lastSave ?? Date.now, savedDate: self.savedDate, arrayHappyness: self.arrayHappyness)
        DataManager.standard.setTimeManager(timeManager: savingTimeManager)
            print("timeManager saved")
    }
    init(){
        let readingTimeManager = DataManager.standard.getTimeManager()
        if readingTimeManager != nil{
            lastSave = readingTimeManager!.lastSave
            savedDate = readingTimeManager!.savedDate
            arrayHappyness = readingTimeManager!.arrayHappyness
        }
        else {
            lastSave = Date.now
            savedDate = Date.now
            arrayHappyness = []
        }
        
        
    }
    func encode(with coder: NSCoder) {
        coder.encode(lastSave, forKey: "lastSave")
        coder.encode(savedDate, forKey: "savedDate")
        
    }
    
    internal required convenience init?(coder decoder: NSCoder) {
        let lastSave = decoder.decodeObject(of: NSDate.self, forKey: "lastSave") as Date?
        let savedDate = decoder.decodeObject(of: NSDate.self, forKey: "SavedDate") as Date?
        
        self.init()
        self.lastSave = lastSave
        
        if lastSave != nil {
            self.lastSave = lastSave
        }
        if savedDate != nil {
            self.savedDate = savedDate!
        }
    }
    
    static let state = TimeManager()
    
    var date : Date {Date.now}
    func timeElapsedsince(date1: Date) -> Int{
        return Int(date - (lastSave ?? date))
    }
    func saveDate (){
        lastSave = date
    }
    
    func AfterOffline(mochi : Mochi,currencies : Currencies) {
        // si dovranno mettere check sull'euphoria e relativi guadagni etc etc
        
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
                arrayHappyness.append(mochi.happiness)
                mochi.energy = max (0, mochi.energy - 1 * (timeElapsedsince(date1: lastSave!))/432)
                mochi.pEnergy = mochi.pEnergy + (100 * (timeElapsedsince(date1: lastSave!)%432)) / 432
                if (mochi.pEnergy > 99) {
                    mochi.pEnergy = mochi.pEnergy - 100
                    mochi.energy = max(0, mochi.energy - 1)
                }
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
      
    }
    func stopStreaming(mochi: Mochi,currencies: Currencies, streamingInventory : StreamingInventory){
        var gain = 0
        var m = 0
        var found = false
        while found == false && m < streamingInventory.i.count{
            if streamingInventory.i[m] == 2 {
                found = true
            }
            else{
                m = m + 1
            }
        }
        if found == true{
            switch m{
            case 0: gain = 15
            default: gain = 15
            }
        }
        else {
                return
            }
        
        var average = 0
        for value in arrayHappyness {
            average += value
        }
        average = average/arrayHappyness.count
        
        if average > 95{
            var secondsOfStreaming = Int(Date.now - savedDate)
            var tempSecondsOfStreaming = secondsOfStreaming
            while tempSecondsOfStreaming/3600 >= 1 {
                currencies.followers = currencies.followers + Int.random(in: 1...2)
                tempSecondsOfStreaming = tempSecondsOfStreaming - 3600
            }
            
            
            var stdGain : Double = Double(secondsOfStreaming * gain  / 3600)
            var extraGain : Double = Double(gain) * 0.001 * Double(currencies.followers * (secondsOfStreaming / 3600))
            currencies.money = currencies.money +  Int(stdGain) + Int(extraGain)
        }
        if average < 96 && average > 80{
            var secondsOfStreaming = Int(Date.now - savedDate)
            var tempSecondsOfStreaming = secondsOfStreaming
            while tempSecondsOfStreaming/3600 >= 1 {
                currencies.followers = currencies.followers + Int.random(in: 0...2)
                tempSecondsOfStreaming = tempSecondsOfStreaming - 3600
            }
            var stdGain : Double = Double(secondsOfStreaming * gain  / 3600)
            var extraGain : Double = Double(gain) * 0.001 * Double(currencies.followers * (secondsOfStreaming / 3600))
            currencies.money = currencies.money +  Int(stdGain) + Int(extraGain)
        }
        if average < 80 && average > 40{
            var secondsOfStreaming = Int(Date.now - savedDate)
            var tempSecondsOfStreaming = secondsOfStreaming
            while tempSecondsOfStreaming/3600 >= 1 {
                currencies.followers = currencies.followers + Int.random(in: 0...1)
                tempSecondsOfStreaming = tempSecondsOfStreaming - 3600
            }
            var stdGain : Double = Double(secondsOfStreaming * gain  / 3600)
            var extraGain : Double = Double(gain) * 0.001 * Double(currencies.followers * (secondsOfStreaming / 3600))
            currencies.money = currencies.money +  Int(stdGain) + Int(extraGain)
        }
        if average < 40 {
            var secondsOfStreaming = Int(Date.now - savedDate)
            var tempSecondsOfStreaming = secondsOfStreaming
            while tempSecondsOfStreaming/3600 >= 1 {
                currencies.followers = currencies.followers - 1
                tempSecondsOfStreaming = tempSecondsOfStreaming - 3600
            }
            var stdGain : Double = Double(secondsOfStreaming * gain  / 3600)
            var extraGain : Double = Double(gain) * 0.001 * Double(currencies.followers * (secondsOfStreaming / 3600))
            let totalGain = (stdGain + extraGain)/2
            currencies.money = currencies.money +  Int(totalGain)
        }
        arrayHappyness.removeAll()
        mochi.streaming = false
    }
    func startStreaming(mochi : Mochi){
    mochi.streaming = true
        savedDate = Date.now
        arrayHappyness.append(mochi.happiness)
    }
    func lightOn(mochi : Mochi){
        if mochi.sleeping{
            mochi.sleeping = false
        }
    }
    func lightOff(mochi: Mochi){
        if mochi.energy < 50 {
            mochi.sleeping = true
        }
    }
    func shower(cleanCount: Int, mochi: Mochi){
        mochi.cleanlyness = min(mochi.cleanlyness + cleanCount * 20 , 100)
    }
    func reduceHunger(mochi: Mochi){
        // inserire euphoria check
        mochi.hunger = max(0, mochi.hunger - 1)
        mochi.pHunger = 0
    }
    func reduceThirst(mochi:Mochi){
        mochi.thirst = max ( 0,mochi.thirst - 1)
        mochi.pThirst = 0
    }
    func spawnPoop(mochi: Mochi){
        mochi.nPoop = mochi.nPoop + 1
        mochi.pPoop = 0
    }
    func reduceCleanlyness(mochi: Mochi){
        mochi.cleanlyness = mochi.cleanlyness + 1
        mochi.pCleanlyness = 0
    }
    func illCheck(mochi: Mochi){
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
        
        mochi.pIll = 0
        
        var roll = Int.random(in: 1...100)
        if roll < illChance {
            mochi.ill = true
        }
        
    }
    func reduceEnergy(mochi: Mochi){
        mochi.energy = max ( 0,mochi.energy - 1)
        mochi.pEnergy = 0
    }
    func gainEnergy(mochi: Mochi){
        mochi.energy = min ( mochi.maxEnergy, mochi.energy + 1)
        mochi.pEnergyGain = 0
    }
    func reduceHealth(mochi: Mochi){
        if mochi.hunger == 0 {
            mochi.health = max (0, mochi.health - 1)
            mochi.pHealthHunger = 0
        }
        if mochi.thirst == 0 {
            mochi.health = max (0, mochi.health - 1 )
            mochi.pHealthThirst = 0
        }
        if mochi.ill == true {
            mochi.health = max (0, mochi.health - 1 )
            mochi.pHealthIll = 25
        }
    }
    func reduceHappyness(mochi: Mochi){
        mochi.pHappyness = 0
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
//    ricordare di contare il svegliarsi da solo del pupo dalla scena
}
