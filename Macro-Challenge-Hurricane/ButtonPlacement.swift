//
//  ButtonPlacement.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 20/05/22.
//

import SwiftUI

struct ButtonPlacement: View {
    var body: some View{
        Button(){}
        label :
        {
            Rectangle()
                .frame(width: 69, height: 69)
                .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.05)
                .foregroundColor(.blue)
        }
        Button(){}
        label :
        {
            Rectangle()
                .frame(width: 69, height: 69)
                .position(x: UIScreen.main.bounds.width*0.13, y: UIScreen.main.bounds.height*0.4)
                .foregroundColor(.green)
        }
        
        
        Button(){}
        label :
        {
            Rectangle()
                .frame(width: 69, height: 69)
                .position(x: UIScreen.main.bounds.width*0.87, y: UIScreen.main.bounds.height*0.40)
                .foregroundColor(.black)
        }
        
        Button(){}
        label :
        {
            Rectangle()
                .frame(width: 69, height: 69)
//                .position(x: UIScreen.main.bounds.width*0.87, y: UIScreen.main.bounds.height*0.10)
                .position(x: 0, y: 0)
                .foregroundColor(.gray)
        }
        
    }
}
