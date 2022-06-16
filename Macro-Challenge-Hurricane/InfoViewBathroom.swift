//
//  InfoViewBathroom.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 15/06/22.
//

import SwiftUI
import AVFoundation

struct InfoViewBathroom: View {
    
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
                        .opacity(0.8)
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
                        .frame(width: 150, height: 200)
                        .position(x: 60, y: 0)
                        .blur(radius: 30)
                        .opacity(1)
                        .overlay{
                            Text("Swipe L")
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 20, y: 0)
                            Text("Center")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 70, y: 0)
                        }
                }
                HStack{
                    //                    VStack{
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140, alignment: .bottomTrailing)
                        .position(x: 60, y: 160)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Shop")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 60, y: 240)
                            Spacer()
                        }
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 150, height: 200)
                        .position(x: 90, y: 190)
                        .blur(radius: 30)
                        .opacity(0.8)
                        .overlay{
                            Text("Clean")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 90, y: 190)
                            Spacer()
                        }
                    Ellipse()
                        .fill(Color.white)
                        .frame(width: 200, height: 140)
                        .position(x: 90, y: 160)
                        .blur(radius: 30)
                        .opacity(0.6)
                        .overlay{
                            Text("Inventory")
                                .font(Font.custom("Mabook", size: 15))
                                .foregroundColor(Color.black)
                                .fontWeight(.bold)
                                .position(x: 75, y: 230)
                            Spacer()
                        }
                }
            }
        }
    }
}