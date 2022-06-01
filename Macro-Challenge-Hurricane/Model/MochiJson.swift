//
//  Mochi.swift
//  TwitchApi
//
//  Created by Alessandro Masullo on 31/05/22.
//


/*
 
 https://stackoverflow.com/questions/28923240/cant-initialize-a-struct-with-a-default-value
 
 https://stackoverflow.com/questions/35700281/date-format-in-swift
 
 */


import Foundation

struct Mochi: Codable {
    var maxHunger : Int = 0
    var maxThirst : Int = 0
    var maxCleanlyness : Int = 0
    var maxHealth : Int = 0
    var maxEnergy : Int = 0
    var maxHappiness : Int = 0
    var hunger : Int = 0
    var thirst : Int = 0
    var cleanlyness : Int = 0
    var health : Int = 0
    var energy : Int = 0
    var happiness : Int = 0
    var ageType : Int = 0
    var followers : Int = 0
    var sleeping : Bool = false
    var streaming : Bool = false
    var ill : Bool = false
    var pHunger: Int = 0
    var pThirst: Int = 0
    var pCleanlyness: Int = 0
    var pHappyness: Int = 0
    var pIll: Int = 0
    var pEnergy: Int = 0
    var pEnergyGain: Int = 0
    var nPoop: Int = 0
    var pPoop: Int = 0
    var pWake: Int = 0
    var pHealthHunger: Int = 0
    var pHealthThirst: Int = 0
    var pHealthIll: Int = 0
    var euphoria : Bool = false
    var birth : Date = Date.now
    var alive : Bool = false
}
