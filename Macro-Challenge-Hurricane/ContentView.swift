//
//  ContentView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 08/06/22.
//

import Foundation
import SwiftUI
import SpriteKit


struct ContentView: View {
    var corner = SKView()
   
    var body: some View {
        
        TamagotchiView()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
