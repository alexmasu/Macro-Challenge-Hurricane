//
//  CGFloat_Ext.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 26/05/22.
//

import Foundation
import CoreGraphics

public extension CGFloat {
    //Convert Degrees to Radiants
    func degreesToRadians()  -> CGFloat {
        return CGFloat.pi * self / 180.0
    }
}
