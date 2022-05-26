//
//  Mochi.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 20/05/22.
//

import Foundation


class Mochi{
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
    var followers: Int
    var money: Int
    var bits : Int
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
    
    
    init (MaxHunger : Int, MaxThirst : Int, MaxCleanlyness : Int, MaxHealth : Int, MaxEnergy : Int, MaxHappyness : Int, Hunger : Int, Thirst : Int, Cleanlyness :Int, Health : Int, Energy : Int, Happiness : Int, AgeType : Int, Followers : Int, Money : Int, Bits :Int){
        
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
        followers = Followers
        money = Money
        bits = Bits
        sleeping = false
        streaming = false
        ill = false
    }
    
}
