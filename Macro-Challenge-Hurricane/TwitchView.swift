//
//  TwitchView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 11/06/22.
//

import SwiftUI


//struct FullScreenModalView: View {
//    @Environment(.presentationMode) var presentationMode
//    var body: some View {
//        ZStack {
//            Color.primary.edgesIgnoringSafeArea(.all)
//            Button("Dismiss Modal") {                 presentationMode.wrappedValue.dismiss()
//            }
//        }
//    }
//}


struct TwitchView: View {
    
    // The game state is used to transition between the different states of the game
    @Binding var currentGameState: GameState
    
    var gamelogic: StreamMochiGameLogic = StreamMochiGameLogic.shared
    
    
    
    var body: some View {
        
        Text("")
        //        WebView().fullScreenCover(isPresented: gamelogic.$temp_bool,content: FullScreenModalView.init)
        //        sheet(isPresented: gamelogic.$temp_bool) {
        //            Text("Dio porco")
        //            WebView()
        //        }
    }
    
    private func backToMainScreen() {
        self.currentGameState = .mainScreen
    }
}
