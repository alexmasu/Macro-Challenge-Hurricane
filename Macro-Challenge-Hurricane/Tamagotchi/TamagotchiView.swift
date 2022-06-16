//
//  TamagotchiView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 23/05/22.
//

import SwiftUI
import SpriteKit



struct TamagotchiView: View {
    
    @ObservedObject var gameLogic: StreamMochiGameLogic =  StreamMochiGameLogic.shared
    
    // The game state is used to transition between the different states of the game
    @Binding var currentGameState: GameState
    
    var scene : SKScene {
        let scene = TamagotchiMainScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
            ZStack {
                SpriteView(scene: scene)
                    .frame(width: UIScreen.main
                        .bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $gameLogic.temp_bool) {
                SheetView(currentGameState: $currentGameState)
                
            }
            .overlay(loadingOverlay)

    }
    
    private func presentTwitchScreen() {
        self.currentGameState = .twitchLogin
    }
    
    @ViewBuilder private var loadingOverlay : some View {
        if gameLogic.curr_room == 1 {
            if gameLogic.show_info {
                InfoView()
            }
        } else if gameLogic.curr_room == 0 {
            if gameLogic.show_info {
                InfoViewBedroom()
            }
        } else if gameLogic.curr_room == 2 {
            if gameLogic.show_info {
                InfoViewBathroom()
            }
        }

}


struct SheetView: View {
    @Binding var currentGameState: GameState
    @StateObject var gameLogic: StreamMochiGameLogic =  StreamMochiGameLogic.shared

    
    var body: some View {
        NavigationView {
            TwitchView(currentGameState: $currentGameState)
                .navigationTitle(Text(""))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    print("ciao")
                    gameLogic.temp_bool.toggle()
                }){
                    Text("Done".localized())
                        .bold()
                })
        }
    }
    
    
    
}
}
