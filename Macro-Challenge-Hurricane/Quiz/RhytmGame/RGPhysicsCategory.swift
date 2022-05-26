//
//  RGPhysicsCategory.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 24/05/22.
//

import Foundation

struct PhysicsCategory {
    static let none : UInt32 = 0
    static let all : UInt32 = UInt32.max
    static let upsx : UInt32 = 0b1
    static let updx : UInt32 = 0b10
    static let downsx : UInt32 = 0b11
    static let downdx : UInt32 = 0b100
    static let usnote: UInt32 = 0b101
}
