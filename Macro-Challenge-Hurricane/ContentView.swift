//
//  ContentView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 16/05/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var corner = SKView()
    
        var body: some View {
            CornerSceneView()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

