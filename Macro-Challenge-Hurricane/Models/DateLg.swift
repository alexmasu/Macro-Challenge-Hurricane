//
//  DateLg.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 30/05/22.
//

import Foundation

class DateLg: NSObject, NSCoding{
    
    
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
        coder.encode(bits,forKey: "bits")
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let money = decoder.decodeObject(of: NSNumber.self, forKey: "money") as! Int? ?? 0
        let bits = decoder.decodeObject(of: NSNumber.self, forKey: "bits") as! Int? ?? 0

        self.init(Money: money, Bits: bits)
    }
    
    init(Money: Int, Bits: Int){
        money = Money
        bits = Bits
    }
    
}

