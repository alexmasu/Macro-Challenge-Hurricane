//
//  WebView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 10/06/22.
//
import SwiftUI

class StreamMochiGameLogic: ObservableObject {
    
    // Single instance of the class
    static let shared: StreamMochiGameLogic = StreamMochiGameLogic()
    
    @Published var temp_bool: Bool = false
    @Published var show_info : Bool = false
    @Published var curr_room : Int = 1
    
}
