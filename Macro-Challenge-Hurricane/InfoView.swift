//
//  InfoView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 15/06/22.
//

import SwiftUI
import AVFoundation

struct InfoView: View {
    
    @StateObject var gameLogic: StreamMochiGameLogic = StreamMochiGameLogic()
    
    
//    @State var currentGameState: GameState = .mainScreen
    
//    @EnvironmentObject var appDelegate: FSAppDelegate
//    @EnvironmentObject var sceneDelegate: FSSceneDelegate
    
    
    var body: some View {
                ZStack{
                    VStack (spacing: 10) {
                        HStack(alignment : .top, spacing: 10){
//                            Text("Customization")
//                        .opacity(0.4)
                Text("Customization")
                    .position(x: 10 , y: 250)
                    .frame(width: 140, height: 90)
                            Ellipse()
                                    .fill(Color.white)
                                    .frame(width: 140, height: 140)
                                    .blur(radius: 30)
//                    .background(Color.purple)
                Spacer()
                }
            }
        }
//            Ellipse()
//                    .fill(Color.white)
//                    .frame(width: 250, height: 150)
//                    .blur(radius: 30)
//                    .opacity(0.4)
    }
}



