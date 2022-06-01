//
//  Currencies.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 30/05/22.
//

import Foundation

class Currencies: NSObject, NSCoding{
    var money :Int
    var bite: Int
    var followers : Int
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
        coder.encode(bite,forKey: "bite")
        coder.encode(followers, forKey: "followers")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let money = decoder.decodeObject(of: NSNumber.self, forKey: "money") as! Int? ?? 0
        let bite = decoder.decodeObject(of: NSNumber.self, forKey: "bite") as! Int? ?? 0
        let followers = decoder.decodeObject(of: NSNumber.self, forKey: "followers") as! Int? ?? 0

        self.init(Money: money, Bite: bite, Followers : followers)
    }
    
    init(Money: Int, Bite: Int, Followers: Int){
        money = Money
        bite = Bite
        followers = Followers
    }
    
}
