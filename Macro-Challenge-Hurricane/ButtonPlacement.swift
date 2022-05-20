//
//  ButtonPlacement.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 20/05/22.
//

import SwiftUI

struct ButtonPlacement: View {
    var body: some View{
        ZStack{
            Button(){}
            label :
            {
                Rectangle()
                    .frame(width: 69, height: 69)
                    .position(x: UIScreen.main.bounds.width*0.12, y: UIScreen.main.bounds.height*0.05)
                    .foregroundColor(.blue)
            }
            Button(){}
            label :
            {
                Rectangle()
                    .frame(width: 69, height: 69)
                    .position(x: UIScreen.main.bounds.width*0.12, y: UIScreen.main.bounds.height*0.85)
                    .foregroundColor(.green)
            }
            
            
            Button(){}
            label :
            {
                Rectangle()
                    .frame(width: 69, height: 69)
                    .position(x: UIScreen.main.bounds.width*0.88, y: UIScreen.main.bounds.height*0.85)
                    .foregroundColor(.black)
            }
            
            Button(){}
            label :
            {
                Rectangle()
                    .frame(width: 69, height: 69)
                    .position(x: UIScreen.main.bounds.width*0.88, y: UIScreen.main.bounds.height*0.05)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ButtonPlacement_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlacement()
    }
}
