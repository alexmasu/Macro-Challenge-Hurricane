//
//  Mochi.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 20/05/22.
//

import Foundation


class Mochi: NSObject, NSCoding{
    
    func save(){
        let savingMochi = MochiJson(maxHunger: self.maxHunger, maxThirst: self.maxHunger, maxCleanlyness: self.maxCleanlyness, maxHealth: self.maxHealth, maxEnergy: self.maxEnergy, maxHappiness: self.maxHappiness, hunger: self.hunger, thirst: self.thirst, cleanlyness: self.cleanlyness, health: self.health, energy: self.energy, happiness: self.happiness, ageType: self.ageType, sleeping: self.sleeping, streaming: self.streaming, ill: self.ill, pHunger: self.pHunger, pThirst: self.pThirst, pCleanlyness: self.pCleanlyness, pHappyness: self.pHappyness, pIll: self.pIll, pEnergy: self.pEnergy, pEnergyGain: self.pEnergyGain, nPoop: self.nPoop, pPoop: self.pPoop, pWake: self.pWake, pHealthHunger: self.pHealthHunger, pHealthThirst: self.pHealthThirst, pHealthIll: self.pHealthIll, euphoria: self.euphoria, birth: self.birth ?? Date.now, alive: self.alive)
        
        DataManager.standard.setMochi(mochi: savingMochi)
            print("mochi saved")
    }
    override init(){
        
        let readingMochi = DataManager.standard.getMochi()
        if readingMochi != nil{
            maxHunger = readingMochi!.maxHunger
            maxThirst = readingMochi!.maxThirst
            maxCleanlyness = readingMochi!.maxCleanlyness
            maxHealth = readingMochi!.maxHealth
            maxEnergy = readingMochi!.maxEnergy
            maxHappiness = readingMochi!.maxHappiness
            health = readingMochi!.health
            energy = readingMochi!.energy
            happiness = readingMochi!.happiness
            ageType = readingMochi!.ageType
            hunger = readingMochi!.hunger
            thirst = readingMochi!.thirst
            cleanlyness = readingMochi!.cleanlyness
            sleeping = readingMochi!.sleeping
            streaming = readingMochi!.streaming
            ill = readingMochi!.ill
            pHunger = readingMochi!.pHunger
            pThirst = readingMochi!.pThirst
            pCleanlyness = readingMochi!.pCleanlyness
            pHappyness = readingMochi!.pHappyness
            pIll = readingMochi!.pIll
            pEnergy = readingMochi!.pEnergy
            pEnergyGain = readingMochi!.pEnergyGain
            nPoop = readingMochi!.nPoop
            pPoop = readingMochi!.pPoop
            pWake = readingMochi!.pWake
            pHealthHunger = readingMochi!.pHealthHunger
            pHealthThirst = readingMochi!.pHealthThirst
            pHealthIll = readingMochi!.pHealthIll
            euphoria = readingMochi!.euphoria
            birth = readingMochi!.birth
            alive = readingMochi!.alive
        }
        else {
            maxHunger = 50
            maxThirst = 50
            maxCleanlyness = 100
            maxHealth = 100
            maxEnergy = 50
            maxHappiness = 100
            health = 100
            energy = 50
            happiness = 100
            ageType = 0
            hunger = 50
            thirst = 50
            cleanlyness = 100
            sleeping = false
            streaming = false
            ill = false
            pHunger = 0
            pThirst = 0
            pCleanlyness = 0
            pHappyness = 0
            pIll = 0
            pEnergy = 0
            pEnergyGain = 0
            nPoop = 0
            pPoop = 0
            pWake = 0
            pHealthHunger = 0
            pHealthThirst = 0
            pHealthIll = 0
            euphoria = false
            birth = Date.now
            alive = true
        }
        
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(maxHunger, forKey: "maxHunger")
        coder.encode(maxThirst, forKey: "maxThirst")
        coder.encode(maxCleanlyness, forKey: "maxCleanlyness")
        coder.encode(maxHealth, forKey: "maxHealth")
        coder.encode(maxEnergy, forKey: "maxEnergy")
        coder.encode(maxHappiness, forKey: "maxHappiness")
        coder.encode(thirst, forKey: "thirst")
        coder.encode(cleanlyness, forKey: "cleanlyness")
        coder.encode(health, forKey: "health")
        coder.encode(energy, forKey: "energy")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(ageType, forKey: "ageType")
        coder.encode(sleeping, forKey: "sleeping")
        coder.encode(streaming, forKey: "streaming")
        coder.encode(ill, forKey: "ill")
        coder.encode(pHunger, forKey: "pHunger")
        coder.encode(pThirst, forKey: "pThirst")
        coder.encode(pCleanlyness, forKey: "pCleanlyness")
        coder.encode(pHappyness, forKey: "pHappyness")
        coder.encode(pIll, forKey: "pIll")
        coder.encode(pEnergy, forKey: "pEnergy")
        coder.encode(pEnergyGain, forKey: "pEnergyGain")
        coder.encode(nPoop, forKey: "nPoop")
        coder.encode(pPoop, forKey: "pPoop")
        coder.encode(pWake, forKey: "pWake")
        coder.encode(pHealthHunger, forKey: "pHealthHunger")
        coder.encode(pHealthThirst, forKey: "pHealthThirst")
        coder.encode(pHealthIll, forKey: "pHealthIll")
        coder.encode(euphoria, forKey: "euphoria")
        coder.encode(birth, forKey: "birth")
        coder.encode(alive, forKey: "alive")
        
        
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let maxHunger = decoder.decodeObject(of: NSNumber.self, forKey: "maxHunger") as! Int? ?? 0
        let maxThirst = decoder.decodeObject(of: NSNumber.self, forKey: "maxThirst") as! Int? ?? 0
        let maxCleanlyness = decoder.decodeObject(of: NSNumber.self, forKey: "maxCleanlyness") as! Int? ?? 0
        let maxHealth = decoder.decodeObject(of: NSNumber.self, forKey: "maxHealth") as! Int? ?? 0
        let maxEnergy = decoder.decodeObject(of: NSNumber.self, forKey: "maxEnergy") as! Int? ?? 0
        let maxHappiness = decoder.decodeObject(of: NSNumber.self, forKey: "maxHappiness") as! Int? ?? 0
        let hunger = decoder.decodeObject(of: NSNumber.self, forKey: "hunger") as! Int? ?? 0
        let thirst = decoder.decodeObject(of: NSNumber.self, forKey: "thirst") as! Int? ?? 0
        let cleanlyness = decoder.decodeObject(of: NSNumber.self, forKey: "cleanlyness") as! Int? ?? 0
        let health = decoder.decodeObject(of: NSNumber.self, forKey: "health") as! Int? ?? 0
        let energy = decoder.decodeObject(of: NSNumber.self, forKey: "energy") as! Int? ?? 0
        let happiness = decoder.decodeObject(of: NSNumber.self, forKey: "happiness") as! Int? ?? 0
        let ageType = decoder.decodeObject(of: NSNumber.self, forKey: "ageType") as! Int? ?? 0
        let sleeping = decoder.decodeObject(of: NSNumber.self, forKey: "sleeping") as! Bool? ?? false
        let streaming = decoder.decodeObject(of: NSNumber.self, forKey: "streaming") as! Bool? ?? false
        let ill = decoder.decodeObject(of: NSNumber.self, forKey: "ill") as! Bool? ?? false
        let pHunger = decoder.decodeObject(of: NSNumber.self, forKey: "pHunger") as! Int? ?? 0
        let pThirst = decoder.decodeObject(of: NSNumber.self, forKey: "pThirst") as! Int? ?? 0
        let pCleanlyness = decoder.decodeObject(of: NSNumber.self, forKey: "pCleanlyness") as! Int? ?? 0
        let pHappyness = decoder.decodeObject(of: NSNumber.self, forKey: "pHappyness") as! Int? ?? 0
        let pIll = decoder.decodeObject(of: NSNumber.self, forKey: "pIll") as! Int? ?? 0
        let pEnergy = decoder.decodeObject(of: NSNumber.self, forKey: "pEnergy") as! Int? ?? 0
        let pEnergyGain = decoder.decodeObject(of: NSNumber.self, forKey: "pEnergyGain") as! Int? ?? 0
        let nPoop = decoder.decodeObject(of: NSNumber.self, forKey: "nPoop") as! Int? ?? 0
        let pPoop = decoder.decodeObject(of: NSNumber.self, forKey: "pPoop") as! Int? ?? 0
        let pWake = decoder.decodeObject(of: NSNumber.self, forKey: "pWake") as! Int? ?? 0
        let pHealthHunger = decoder.decodeObject(of: NSNumber.self, forKey: "pHealthHunger") as! Int? ?? 0
        let pHealthThirst = decoder.decodeObject(of: NSNumber.self, forKey: "pHealthThirst") as! Int? ?? 0
        let pHealthIll = decoder.decodeObject(of: NSNumber.self, forKey: "pHealthIll") as! Int? ?? 0
        let euphoria = decoder.decodeObject(of: NSNumber.self, forKey: "euphoria") as! Bool? ?? false
        let birth = decoder.decodeObject(of: NSDate.self, forKey: "birth") as Date?
        let alive = decoder.decodeObject(of: NSNumber.self, forKey: "alive") as! Bool? ?? false
        
        self.init(MaxHunger : maxHunger, MaxThirst : maxThirst, MaxCleanlyness : maxCleanlyness, MaxHealth : maxHealth, MaxEnergy : maxEnergy, MaxHappyness : maxHappiness, Hunger : hunger, Thirst : thirst, Cleanlyness :cleanlyness, Health : health, Energy : energy, Happiness : happiness, AgeType : ageType, Alive : alive)
        self.sleeping = sleeping
        self.streaming = streaming
        self.ill = ill
        self.pHunger = pHunger
        self.pThirst = pThirst
        self.pCleanlyness = pCleanlyness
        self.pHappyness = pHappyness
        self.pIll = pIll
        self.pEnergy = pEnergy
        self.pEnergyGain = pEnergyGain
        self.nPoop = nPoop
        self.pPoop = pPoop
        self.pWake = pWake
        self.pHealthHunger = pHealthHunger
        self.pHealthThirst = pHealthThirst
        self.pHealthIll = pHealthIll
        self.euphoria = euphoria
        self.birth = birth
        
        
    }
    
    var maxHunger : Int
    var maxThirst : Int
    var maxCleanlyness : Int
    var maxHealth : Int
    var maxEnergy : Int
    var maxHappiness : Int
    var hunger : Int
    var thirst: Int
    var cleanlyness: Int
    var health: Int
    var energy: Int
    var happiness: Int
    var ageType: Int
    var sleeping : Bool
    var streaming : Bool
    var ill : Bool
    var pHunger = 0
    var pThirst = 0
    var pCleanlyness = 0
    var pHappyness = 0
    var pIll = 0
    var pEnergy = 0
    var pEnergyGain = 0
    var nPoop = 0
    var pPoop = 0
    var pWake = 0
    var pHealthHunger = 0
    var pHealthThirst = 0
    var pHealthIll = 0
    var euphoria = false
    var birth : Date?
    var alive : Bool
    
    
    init (MaxHunger : Int, MaxThirst : Int, MaxCleanlyness : Int, MaxHealth : Int, MaxEnergy : Int, MaxHappyness : Int, Hunger : Int, Thirst : Int, Cleanlyness :Int, Health : Int, Energy : Int, Happiness : Int, AgeType : Int, Alive :Bool){
        
        maxHunger = MaxHunger
        maxThirst = MaxThirst
        maxCleanlyness = MaxCleanlyness
        maxHealth = MaxHealth
        maxEnergy = MaxEnergy
        maxHappiness = MaxHappyness
        hunger = Hunger
        thirst = Thirst
        cleanlyness = Cleanlyness
        health = Health
        energy = Energy
        happiness = Happiness
        ageType = AgeType
        sleeping = false
        streaming = false
        ill = false
        alive = Alive
    }
    
}
