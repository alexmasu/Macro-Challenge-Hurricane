//
//  ContentView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 13/05/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @EnvironmentObject var appDelegate: FSAppDelegate
    @EnvironmentObject var sceneDelegate: FSSceneDelegate
    
    var body: some View {
        TamagotchiView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// on disappear, queue ,concurrency lab
