//
//  TamagotchiView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 23/05/22.
//

import SwiftUI
import SpriteKit



struct TamagotchiView: View {
    
    @StateObject var gameLogic: StreamMochiGameLogic =  StreamMochiGameLogic.shared
    @State var showTwitch  = false
    
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
            .sheet(isPresented: $showTwitch) {
                SheetView(showTwitch: self.$showTwitch, currentGameState: $currentGameState)
//                TwitchView(currentGameState: $currentGameState)
            }
        .onChange(of: gameLogic.temp_bool) { _ in
            if gameLogic.temp_bool {
                
                //                withAnimation() {
                showTwitch = true
                //                     self.presentTwitchScreen()
                //                }
            }
        }
    }
    
    private func presentTwitchScreen() {
        self.currentGameState = .twitchLogin
    }
}


//struct TamagotchiView_Previews: PreviewProvider {
//    static var previews: some View {
//        TamagotchiView()
//    }
//}


struct SheetView: View {
    @Binding var showTwitch : Bool
    @Binding var currentGameState: GameState
    @StateObject var gameLogic: StreamMochiGameLogic =  StreamMochiGameLogic.shared

    
    var body: some View {
        NavigationView {
            TwitchView(currentGameState: $currentGameState)
                .navigationTitle(Text(""))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showTwitch = false
                    gameLogic.temp_bool = false
                }){
                    Text("Done".localized())
                        .bold()
                })
        }
    }
    
}
