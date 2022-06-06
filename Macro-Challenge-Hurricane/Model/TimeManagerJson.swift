//
//  TimeManagerJson.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 05/06/22.
//

import Foundation
struct TimeManagerJson: Codable{
    var lastSave : Date
    var savedDates : [Date?]
}
