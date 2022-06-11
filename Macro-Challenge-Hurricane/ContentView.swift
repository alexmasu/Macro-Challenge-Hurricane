//
//  ContentView.swift
//  Test_JSON
//
//  Created by Antonio Emanuele Cutarella on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameLogic: StreamMochiGameLogic = StreamMochiGameLogic()
    
    @State var currentGameState: GameState = .mainScreen
    
    
    
    @EnvironmentObject var appDelegate: FSAppDelegate
    @EnvironmentObject var sceneDelegate: FSSceneDelegate
    
    
    var body: some View {
        
        switch currentGameState {
        case .mainScreen:
            TamagotchiView(currentGameState: $currentGameState)
                .environmentObject(gameLogic)
        
        case .twitchLogin:
            TwitchView(currentGameState: $currentGameState)
                .environmentObject(gameLogic)
        }
    }
}

