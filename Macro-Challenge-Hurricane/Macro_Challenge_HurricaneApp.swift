//
//  Macro_Challenge_HurricaneApp.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 13/05/22.
//

import SwiftUI

@main
struct Macro_Challenge_HurricaneApp: App {
    
    var activeroom = -1
    
    var body: some Scene {
        WindowGroup {
//                        TamagotchiView()
//                        .statusBar(hidden: true)
//                        .ignoresSafeArea()
//                        BathroomSceneView()
//                            .statusBar(hidden: true)
//                            .ignoresSafeArea()
            TamagotchiView()
//                .statusBar(hidden: true)
//                .ignoresSafeArea()
//            InventorySceneView()
                .statusBar(hidden: true)
                .ignoresSafeArea()
        }
    }
}
