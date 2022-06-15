//
//  InfoViewBedroom.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 15/06/22.
//

import SwiftUI
import AVFoundation

struct InfoViewBedroom: View {
    
    @StateObject var gameLogic: StreamMochiGameLogic = StreamMochiGameLogic()
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140)
                        .position(x: 70, y: 60)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Customization")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 70, y: 60)
                            Spacer()
                        }
                    
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140)
                        .position(x: 160, y: 60)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Twitch")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 160, y: 60)
                            Spacer()
                        }
                    
                }
                HStack{
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140, alignment: .bottomTrailing)
                        .position(x: 70, y: 390)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Shop")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 60, y: 380)
                            Spacer()
                        }
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140, alignment: .bottomTrailing)
                        .position(x: 60, y: 340)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Light Switch")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 60, y: 340)
                            Spacer()
                        }
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140)
                        .position(x: 80, y: 380)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Inventory")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 80, y: 380)
                            Spacer()
                        }
                }
            }
        }
    }
}



