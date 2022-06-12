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
        }.onChange(of: gameLogic.temp_bool) { _ in
            if gameLogic.temp_bool {
                
                /** # PRO TIP!
                 * You can experiment by adding other types of animations here before presenting the game over screen.
                 */
                
                withAnimation {
                    
                     self.presentTwitchScreen()
                }
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
