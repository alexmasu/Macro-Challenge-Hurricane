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
    private init(){
        savedDate = date
    }
    static let timeManager = TimeManager()
     var savedDate : Date?
    
    var date : Date {Date.now}
    func timeElapsedsince(date1: Date) -> Int{
        return Int(savedDate!-date)
    }
    func saveDate (){
        savedDate = date
    }
    func reduceStatsAfterOffline(mochi : Mochi) {
        if mochi.sleeping == false{
        mochi.hunger = max(0, mochi.hunger - 1 * (timeElapsedsince(date1: savedDate!))/420)
        }
    }
      
}

