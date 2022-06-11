//
//  TwitchView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 11/06/22.
//

import SwiftUI

struct TwitchView: View {
    
    // The game state is used to transition between the different states of the game
    @Binding var currentGameState: GameState
    
    
    var body: some View {
        WebView()
    }
    
    private func backToMainScreen() {
        self.currentGameState = .mainScreen
    }
}
