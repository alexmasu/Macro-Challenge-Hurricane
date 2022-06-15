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
    @Published var square_pos_x : CGFloat = 0
    @Published var square_pos_y : CGFloat = 0
    @Published var curr_room : Int = 1
    
}
